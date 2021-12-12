import 'package:telleo/domain/core/base/entity.dart';

class MessageEntity extends Entity {
  final String sender;
  final String content;

  const MessageEntity({
    required this.sender,
    required this.content,
  });

  @override
  List<Object?> get props => [sender, content];
}
