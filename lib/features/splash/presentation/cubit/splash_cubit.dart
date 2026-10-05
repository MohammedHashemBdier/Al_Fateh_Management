import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepository _authRepository;

  SplashCubit({AuthRepository? authRepository})
    : _authRepository = authRepository ?? AuthRepositoryImpl(),
      super(const SplashInitial());

  Future<void> initializeApp() async {
    emit(
      const SplashLoading(progress: 0.15, statusKey: 'splash_step_resources'),
    );
    await Future.delayed(const Duration(milliseconds: 350));

    emit(const SplashLoading(progress: 0.45, statusKey: 'splash_step_network'));
    await Future.delayed(const Duration(milliseconds: 350));

    emit(const SplashLoading(progress: 0.80, statusKey: 'splash_step_system'));

    // التحقق الأمني من وجود جلسة صالحة ومحفوظة مسبقاً (Auto-login / Remember Me)
    final savedSession = await _authRepository.getSavedSession();

    await Future.delayed(const Duration(milliseconds: 300));

    emit(
      const SplashLoading(progress: 1.0, statusKey: 'splash_step_completed'),
    );
    await Future.delayed(const Duration(milliseconds: 200));

    if (savedSession != null) {
      emit(SplashCompleted(targetRoute: '/home', session: savedSession));
    } else {
      emit(const SplashCompleted(targetRoute: '/login'));
    }
  }
}
