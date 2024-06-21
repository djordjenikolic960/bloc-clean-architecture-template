import 'package:go_router/go_router.dart';

import '../../l10n/localization_extension.dart';
import '../../shared/dimens.dart';
import '../../shared/extension/build_context_extension.dart';
import '../router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/loading_widget.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_input_field.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
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
                  padding: const EdgeInsets.all(Dimens.size20),
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        context.l10n.welcome_title,
                        style: context.textTheme.titleLarge,
                      ),
                      const Spacer(),
                      TextInputField(
                        controller: _emailController,
                        isError: !state.isEmailValid,
                        errorMessage: context.l10n.invalid_email_message,
                        label: context.l10n.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: Dimens.size12,
                      ),
                      TextInputField(
                        controller: _passwordController,
                        isError: !state.isPasswordValid,
                        errorMessage: context.l10n.invalid_password_message,
                        label: context.l10n.password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !state.showPassword,
                        suffixIcon: state.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixIconOnClick: () {
                          context
                              .read<LoginBloc>()
                              .add(UpdatePasswordVisibility());
                        },
                      ),
                      const SizedBox(
                        height: Dimens.size12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              context.push(Routes.forgotPassword.path);
                            },
                            child: Text(
                              context.l10n.forgot_you_password_message,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      PrimaryButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                LoginWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text,
                                ),
                              );
                        },
                        label: context.l10n.log_in,
                        fillColor: context.colorScheme.primary,
                        titleColor: Colors.white,
                      ),
                      const SizedBox(height: Dimens.size16),
                      InkWell(
                        onTap: () {
                          context.go(Routes.signUp.path);
                        },
                        child: Text(context.l10n.sign_up_message),
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
    super.dispose();
  }
}
