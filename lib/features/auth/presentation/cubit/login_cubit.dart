import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';
import 'login_state.dart';

/// ViewModel المتحكم في شاشة تسجيل الدخول وفق معمارية MVVM
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repository;

  LoginCubit({AuthRepository? repository})
      : _repository = repository ?? AuthRepositoryImpl(),
        super(const LoginInitial()) {
    loadInitialData();
  }

  /// تحميل البيانات الأولية وتفقد اسم المستخدم المحفوظ
  Future<void> loadInitialData() async {
    try {
      final remembered = await _repository.getRememberedUsername();
      if (state is LoginInitial) {
        final current = state as LoginInitial;
        emit(LoginInitial(
          initialUsername: remembered,
          rememberMe: remembered != null && remembered.isNotEmpty,
          isSkeletonPreview: current.isSkeletonPreview,
        ));
      }
    } catch (_) {}
  }

  /// تبديل حالة "تذكرني"
  void toggleRememberMe(bool value) {
    if (state is LoginInitial) {
      final current = state as LoginInitial;
      emit(current.copyWith(rememberMe: value));
    }
  }

  /// تبديل وضع معاينة الهيكل العظمي (Skeleton Loading Preview)
  void toggleSkeletonPreview() {
    if (state is LoginInitial) {
      final current = state as LoginInitial;
      emit(current.copyWith(isSkeletonPreview: !current.isSkeletonPreview));
    }
  }

  /// تنفيذ عملية تسجيل الدخول
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final cleanUsername = username.trim();
    if (cleanUsername.isEmpty || password.isEmpty) {
      emit(const LoginFailure('login_error_empty_fields'));
      return;
    }

    bool rememberMe = true;
    if (state is LoginInitial) {
      rememberMe = (state as LoginInitial).rememberMe;
    }

    emit(const LoginLoading());

    try {
      final session = await _repository.login(
        username: cleanUsername,
        password: password,
        rememberMe: rememberMe,
      );
      emit(LoginSuccess(session));
    } catch (e) {
      String msg = e.toString();
      if (msg.startsWith('Exception: ')) {
        msg = msg.replaceFirst('Exception: ', '');
      }
      emit(LoginFailure(msg));
    }
  }
}
