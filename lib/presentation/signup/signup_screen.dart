import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/localization_extension.dart';
import '../../shared/dimens.dart';
import '../../shared/extension/build_context_extension.dart';
import '../router/routes.dart';
import '../widgets/loading_widget.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_input_field.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_event.dart';
import 'bloc/signup_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.go(Routes.bottomNavigation.path);
        }
        if (state.isFailure && state.failureMessage != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.failureMessage!)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            bottom: true,
            top: true,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimens.size16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.welcome_title,
                        style: context.textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: Dimens.size64,
                      ),
                      TextInputField(
                        controller: _nameController,
                        isError: !state.isNameValid,
                        errorMessage: context.l10n.invalid_name_message,
                        label: context.l10n.name,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: Dimens.size16),
                      TextInputField(
                        controller: _emailController,
                        isError: !state.isEmailValid,
                        errorMessage: context.l10n.invalid_email_message,
                        label: context.l10n.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: Dimens.size16),
                      TextInputField(
                        controller: _passwordController,
                        isError: !state.isPasswordValid,
                        errorMessage: context.l10n.invalid_password_message,
                        label: context.l10n.password,
                        obscureText: !state.showPassword,
                        suffixIcon: state.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixIconOnClick: () {
                          context.read<SignupBloc>().add(
                                UpdatePasswordVisibility(),
                              );
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: Dimens.size64),
                      PrimaryButton(
                        onPressed: () {
                          context.read<SignupBloc>().add(
                                SignupWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text,
                                  _nameController.text,
                                ),
                              );
                        },
                        label: context.l10n.sign_up,
                        fillColor: context.colorScheme.primary,
                        titleColor: Colors.white,
                      ),
                      const SizedBox(height: Dimens.size16),
                      InkWell(
                        onTap: () {
                          context.go(Routes.login.path);
                        },
                        child: Text(context.l10n.login_message),
                      )
                    ],
                  ),
                ),
                if (state.isSubmitting) const LoadingWidget()
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
