import socketio from "socket.io";
import ChatsRepository from "../api/chats/domain/chats_repository";
import log from "../core/data/logging/log";

import MessagePacket from "./message_packet";
export default function registerChatEvents(
  io: socketio.Server,
  chatsRepository: ChatsRepository
) {
  io.on("connection", (socket: socketio.Socket) => {
    const uid = socket.handshake.query.uid as string;
    socket.join(uid);
    socket.on("send-message", async (data) => {
      await onSendMessage(io, socket, chatsRepository, data);
    });
  });
}

async function onSendMessage(
  io: socketio.Server,
  socket: socketio.Socket,
  chatsRepository: ChatsRepository,
  data: any
): Promise<void> {
  const packet: MessagePacket = MessagePacket.fromJson(data);

  log.info("Received message from socket: " + socket.id);
  log.info(packet.message);

  const result = await chatsRepository.addMessage(
    packet.chatId,
    packet.message.toEntity()
  );
  result.fold(
    (failure) => {},
    (chat) => {
      // io.to(packet.message.sender).emit("sent-message")
      io.to(packet.to).emit("receive-message", packet);
    }
  );
}
