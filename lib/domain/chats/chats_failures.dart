import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_failures.freezed.dart';

@freezed
abstract class ChatsFailure with _$ChatsFailure {
  const factory ChatsFailure.serverError() = ChatsServerFailure;
  const factory ChatsFailure.noConnection() = NoConnectionFailure;
  const factory ChatsFailure.invalidAccessToken() = InvalidAccessTokenFailure;
}
