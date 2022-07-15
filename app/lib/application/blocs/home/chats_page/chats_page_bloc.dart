import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../app/chat/loader/chat_bloc.dart';
import '../../app/user/loader/user_bloc.dart';

import '../../../../domain/chats/chat_entity.dart';
import '../../../../domain/core/async_value.dart';
import '../../../../domain/core/dartz_option_ext.dart';
import '../../../../domain/core/services/api_service/api_service.dart';
import '../../../../domain/user/user_entity.dart';

part 'chats_page_bloc.freezed.dart';
part 'chats_page_event.dart';
part 'chats_page_state.dart';

@lazySingleton
class ChatsPageBloc extends Bloc<ChatsPageEvent, ChatsPageState> {
  final ChatBloc chatBloc;
  final UserBloc userBloc;

  ChatsPageBloc(this.chatBloc, this.userBloc)
      : super(
          const ChatsPageState.initial(),
        ) {}
}
