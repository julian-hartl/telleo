import 'package:flutter/material.dart';
import 'config.dart';

import 'telleo.dart';
import 'package:socket_io_client/socket_io_client.dart';

void main() async {
  await configureApp();
  runApp(Telleo());
}
