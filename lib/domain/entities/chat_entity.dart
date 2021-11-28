import 'package:telleo/domain/core/entity.dart';
import 'package:telleo/domain/entities/user_entity.dart';

class ChatEntity extends Entity {
  final UserEntity contact;
  final List<String> messages;

  ChatEntity({
    required this.contact,
    required this.messages,
  });

  @override
  List<Object?> get props => [contact, messages];
}
