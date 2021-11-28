import 'package:flutter/material.dart';

import '../../routing/routing.dart';
import '../../widgets/telleo_widgets/telleo_text_button.dart';
import 'auth_page/auth_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('assets/logo.png')),
                  Text(
                    'New chat experience.',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              TelleoTextButton(
                onPressed: () {
                  context.pushLeftToRight(const AuthPage());
                },
                text: 'Get Started',
                flex: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
