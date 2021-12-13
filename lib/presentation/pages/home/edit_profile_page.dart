import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telleo/presentation/constants/decorations.dart';
import 'package:telleo/presentation/constants/padding.dart';
import 'package:telleo/presentation/widgets/isolated/theme_builder.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static const profilePictureRadius = 70.0;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(builder: (context, theme) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: profilePictureRadius,
              ),
              const Gap(20),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: outlineInputDecoration(
                      theme,
                      hint: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const Gap(15),
                  TextFormField(
                    decoration: outlineInputDecoration(
                      theme,
                      hint: 'Username',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ],
              ))
            ],
          ),
        ),
      );
    });
  }
}
