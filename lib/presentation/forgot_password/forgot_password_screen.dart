import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/localization_extension.dart';
import '../../shared/dimens.dart';
import '../../shared/extension/build_context_extension.dart';
import '../widgets/loading_widget.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_input_field.dart';
import 'bloc/forgot_password_bloc.dart';
import 'bloc/forgot_password_event.dart';
import 'bloc/forgot_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is EmailSendSuccess) {
          context.pop();
        }
        if (state is EmailSendFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.l10n.generic_error_message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: context.textTheme.bodyMedium?.color,
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimens.size20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.forgot_password,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: Dimens.size16,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Dimens.size32),
                      child: Text(
                        context.l10n.forgot_password_subtitle,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.size64,
                    ),
                    TextInputField(
                      controller: _emailController,
                      isError: false,
                      label: context.l10n.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: Dimens.size16,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        context
                            .read<ForgotPasswordBloc>()
                            .add(SendPasswordResetEmail(_emailController.text));
                      },
                      label: context.l10n.send,
                      fillColor: context.colorScheme.primary,
                      titleColor: Colors.white,
                    ),
                  ],
                ),
              ),
              if (state is EmailSendLoading) const LoadingWidget(),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
