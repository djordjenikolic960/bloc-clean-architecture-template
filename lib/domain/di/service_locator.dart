import 'package:get_it/get_it.dart';

import '../use_case/app_config/get_app_config_stream_use_case.dart';
import '../use_case/app_config/get_app_config_stream_use_case_impl.dart';
import '../use_case/app_config/set_app_config_use_case.dart';
import '../use_case/app_config/set_app_config_use_case_impl.dart';
import '../use_case/auth/get_auth_state_change_use_case.dart';
import '../use_case/auth/get_auth_state_change_use_case_impl.dart';
import '../use_case/auth/send_password_reset_email_use_case.dart';
import '../use_case/auth/send_password_reset_email_use_case_impl.dart';
import '../use_case/auth/sign_in_with_email_and_password_use_case.dart';
import '../use_case/auth/sign_in_with_email_and_password_use_case_impl.dart';
import '../use_case/auth/sign_out_use_case.dart';
import '../use_case/auth/sign_out_use_case_impl.dart';
import '../use_case/auth/sign_up_with_email_and_password_use_case.dart';
import '../use_case/auth/sign_up_with_email_and_password_use_case_impl.dart';
import '../use_case/user/get_user_as_stream_use_case.dart';
import '../use_case/user/get_user_as_stream_use_case_impl.dart';
import '../use_case/user/save_user_use_case.dart';
import '../use_case/user/save_user_use_case_impl.dart';

final serviceLocator = GetIt.instance;

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

Future<void> init() async {
  _registerUseCases();
}

void _registerUseCases() {
  serviceLocator.registerFactory<GetAppConfigStreamUseCase>(
    () => GetAppConfigStreamUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SetAppConfigUseCase>(
    () => SetAppConfigUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SignInWithEmailAndPasswordUseCase>(
    () => SignInWithEmailAndPasswordUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SignUpWithEmailAndPasswordUseCase>(
    () => SignUpWithEmailAndPasswordUseCaseImpl(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SignOutUseCase>(
    () => SignOutUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetAuthStateChangeUseCase>(
    () => GetAuthStateChangeUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SaveUserUseCase>(
    () => SaveUserUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetUserAsStreamUseCase>(
    () => GetUserAsStreamUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SendPasswordResetEmailUseCase>(
    () => SendPasswordResetEmailUseCaseImpl(
      serviceLocator(),
    ),
  );
}
