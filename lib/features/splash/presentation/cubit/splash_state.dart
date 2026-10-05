import '../../../auth/domain/models/auth_session.dart';

abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  final double progress;
  final String statusKey;

  const SplashLoading({this.progress = 0.0, this.statusKey = 'splash_loading'});
}

class SplashCompleted extends SplashState {
  final String targetRoute;
  final AuthSession? session;

  const SplashCompleted({this.targetRoute = '/login', this.session});
}
