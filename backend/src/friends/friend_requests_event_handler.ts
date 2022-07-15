import socketio from "socket.io";
import log from "../core/data/logging/log";

import FriendsRepository from "./friends_repository";

export default function registerFriendRequestsEvents(
    io: socketio.Server,
    friendsRepository: FriendsRepository
): void {
    io.on("connection", (socket: socketio.Socket) => {
        const uid = socket.handshake.query.uid as string;
        socket.join(uid);
        socket.on("send-friend-request", async (data) => {
            await onSendFriendRequest(data, socket, friendsRepository);
        });
    });
}

async function onSendFriendRequest(
    data: any,
    socket: socketio.Socket,
    friendsRepository: FriendsRepository
): Promise<void> {
    try {
        const from: string = data.from;
        const to: string = data.to;
        const result = await friendsRepository.addFriend(from, to);
        result.fold(
            (failure) => {
                log.info(failure);
                socket.emit("send-friend-request-failure");
            },
            (_) => {
                socket.emit("send-friend-request-success");
            }
        );
    } catch (e) {
        socket.emit("send-friend-request-failure");
        log.error(e);
    }
}
