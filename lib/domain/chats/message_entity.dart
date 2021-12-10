import '../core/base/entity.dart';
import '../user/user_entity.dart';

class MessageEntity extends Entity {
  final String sender;
  final String content;

  MessageEntity({
    required this.sender,
    required this.content,
  });

  @override
  List<Object?> get props => [sender, content];
}
