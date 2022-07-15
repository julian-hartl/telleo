import 'package:flutter/cupertino.dart';

extension NavContext on BuildContext {
  Future<T?> pushLeftToRight<T>(Widget page) => Navigator.of(this).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset(0, 0);
            final tween = Tween<Offset>(begin: begin, end: end);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );

  Future<T?> pushBottomToTop<T>(Widget page) => Navigator.of(this).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0, 1);
            const end = Offset(0, 0);
            final tween = Tween<Offset>(begin: begin, end: end);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );

  void pop<T>([T? result]) => Navigator.of(this).pop<T>();
}
