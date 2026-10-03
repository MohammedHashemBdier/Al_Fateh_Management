import '../../domain/models/auth_session.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  final String? initialUsername;
  final bool rememberMe;
  final bool isSkeletonPreview;

  const LoginInitial({
    this.initialUsername,
    this.rememberMe = true,
    this.isSkeletonPreview = false,
  });

  LoginInitial copyWith({
    String? initialUsername,
    bool? rememberMe,
    bool? isSkeletonPreview,
  }) {
    return LoginInitial(
      initialUsername: initialUsername ?? this.initialUsername,
      rememberMe: rememberMe ?? this.rememberMe,
      isSkeletonPreview: isSkeletonPreview ?? this.isSkeletonPreview,
    );
  }
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final AuthSession session;

  const LoginSuccess(this.session);
}

class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure(this.errorMessage);
}
