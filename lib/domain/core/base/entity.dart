import 'package:equatable/equatable.dart';

abstract class Entity extends Equatable {
  @override
  bool? get stringify => true;
}
