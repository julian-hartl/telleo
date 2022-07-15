import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:telleo/domain/user/user_entity.dart';
import 'package:telleo/presentation/constants/decorations.dart';
import 'package:telleo/presentation/constants/padding.dart';
import 'package:telleo/presentation/utils/show_snackbar.dart';
import 'package:telleo/presentation/widgets/isolated/theme_builder.dart';
import 'package:telleo/presentation/widgets/telleo_widgets/telleo_button.dart';
import 'package:telleo/application/blocs/home/edit_profile_page/edit_profile_page_bloc.dart';
import 'package:telleo/utils/dependencies.dart';

class EditProfilePage extends HookWidget {
  const EditProfilePage({Key? key, required this.user}) : super(key: key);

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    app.get<EditProfilePageBloc>().add(EditProfilePageEvent.initialize(
          email: user.email,
          username: user.name,
          profilePictureUrl: user.profilePictureUrl,
        ));
    return _EditProfilePageContent(user: user);
  }
}

class _EditProfilePageContent extends HookWidget {
  const _EditProfilePageContent({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserEntity user;
  static const profilePictureRadius = 70.0;

  @override
  Widget build(BuildContext context) {
    final emailTextController = useTextEditingController(text: user.email);
    final usernameTextController = useTextEditingController(text: user.name);
    return ThemeProvider(builder: (context, theme) {
      return BlocListener<EditProfilePageBloc, EditProfilePageState>(
        listener: (context, state) {
          state.userFailureOrSuccess.map(
            (failureOrSuccess) => failureOrSuccess.fold(
              (l) {
                showErrorSnackbar(context,
                    message: l.maybeWhen(
                      orElse: () => 'Unknown error occurred',
                      noConnection: () => 'Please check your connection',
                    ));
              },
              (_) => AutoRouter.of(context).pop(),
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: BlocBuilder<EditProfilePageBloc, EditProfilePageState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      if (state.isUpdating) {
                        return;
                      }
                      AutoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  );
                },
              ),
            ),
            actions: [
              TelleoButton(
                child: const Icon(Icons.done),
                onPressed: () {
                  context
                      .read<EditProfilePageBloc>()
                      .add(const EditProfilePageEvent.save());
                },
                background: theme.backgroundColor,
              )
            ],
          ),
          body: Padding(
            padding: pagePadding,
            child: _EditProfilePageForm(
              profilePictureRadius: profilePictureRadius,
              user: user,
              emailTextController: emailTextController,
              usernameTextController: usernameTextController,
            ),
          ),
        ),
      );
    });
  }
}

class _EditProfilePageForm extends StatelessWidget {
  const _EditProfilePageForm({
    Key? key,
    required this.profilePictureRadius,
    required this.user,
    required this.emailTextController,
    required this.usernameTextController,
  }) : super(key: key);

  final double profilePictureRadius;
  final UserEntity user;
  final TextEditingController emailTextController;
  final TextEditingController usernameTextController;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(builder: (context, theme) {
      return BlocBuilder<EditProfilePageBloc, EditProfilePageState>(
        builder: (context, state) {
          if (state.isUpdating) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: profilePictureRadius,
                foregroundImage: NetworkImage(user.profilePictureUrl),
              ),
              const Gap(20),
              Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: outlineInputDecoration(
                        theme,
                        hint: 'Email',
                      ),
                      validator: (_) => state.emailAdress.value
                          .fold((failure) => 'Invalid email.', (_) => null),
                      controller: emailTextController,
                      onChanged: (value) => context
                          .read<EditProfilePageBloc>()
                          .add(EditProfilePageEvent.emailChanged(value)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Gap(15),
                    TextFormField(
                      decoration: outlineInputDecoration(
                        theme,
                        hint: 'Username',
                      ),
                      validator: (_) => state.username.value
                          .fold((failure) => 'Invalid username.', (_) => null),
                      onChanged: (value) => context
                          .read<EditProfilePageBloc>()
                          .add(EditProfilePageEvent.usernameChanged(value)),
                      controller: usernameTextController,
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      );
    });
  }
}
