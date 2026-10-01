import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  Future<void> initializeApp() async {
    emit(const SplashLoading(
      progress: 0.15,
      statusKey: 'splash_step_resources',
    ));
    await Future.delayed(const Duration(milliseconds: 600));

    emit(const SplashLoading(
      progress: 0.45,
      statusKey: 'splash_step_network',
    ));
    await Future.delayed(const Duration(milliseconds: 700));

    emit(const SplashLoading(
      progress: 0.80,
      statusKey: 'splash_step_system',
    ));
    await Future.delayed(const Duration(milliseconds: 700));

    emit(const SplashLoading(
      progress: 1.0,
      statusKey: 'splash_step_completed',
    ));
    await Future.delayed(const Duration(milliseconds: 500));

    emit(const SplashCompleted());
  }
}
