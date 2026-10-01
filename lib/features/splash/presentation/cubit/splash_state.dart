abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  final double progress;
  final String statusKey;

  const SplashLoading({
    this.progress = 0.0,
    this.statusKey = 'splash_loading',
  });
}

class SplashCompleted extends SplashState {
  const SplashCompleted();
}
