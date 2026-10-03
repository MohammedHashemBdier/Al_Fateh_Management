import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/app_snackbars.dart';
import '../../../../core/widgets/app_animations.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/app_theme_language_switchers.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import 'widgets/login_branding_panel.dart';
import 'widgets/login_form_card.dart';

/// واجهة تسجيل الدخول الرئيسية المتجاوبة (Cross-Platform Responsive Login View)
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: const _LoginViewBody(),
    );
  }
}

class _LoginViewBody extends StatelessWidget {
  const _LoginViewBody();

  String _resolveErrorMessage(BuildContext context, String raw) {
    final clean = raw.trim();
    if (clean == 'login_error_empty_fields' ||
        clean.contains('يرجى إدخال اسم المستخدم') ||
        clean.contains('Please enter username')) {
      return context.tr('login_error_empty_fields');
    }
    if (clean == 'login_error_invalid_password' ||
        clean.contains('كلمة المرور غير صحيحة') ||
        clean.contains('Incorrect password')) {
      return context.tr('login_error_invalid_password');
    }
    if (clean == 'login_error_user_not_found' ||
        clean.contains('اسم المستخدم غير موجود') ||
        clean.contains('Username not found')) {
      return context.tr('login_error_user_not_found');
    }
    if (clean == 'login_error_account_disabled' ||
        clean.contains('تم تعطيل هذا الحساب') ||
        clean.contains('account has been disabled')) {
      return context.tr('login_error_account_disabled');
    }
    if (clean == 'login_error_network' ||
        clean.contains('SocketException') ||
        clean.contains('DioException') ||
        clean.contains('network') ||
        clean.contains('Network') ||
        clean.contains('connect') ||
        clean.contains('اتصال') ||
        clean.contains('إنترنت')) {
      return context.tr('login_error_network');
    }
    if (clean == 'login_error_generic' ||
        clean.contains('فشل تسجيل الدخول') ||
        clean.contains('Login failed')) {
      return context.tr('login_error_generic');
    }
    final translated = context.tr(clean);
    return translated.isNotEmpty ? translated : context.tr('login_error_generic');
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          final localizedError = _resolveErrorMessage(context, state.errorMessage);
          AppSnackbars.showError(context, localizedError);
        } else if (state is LoginSuccess) {
          if (state.session.isOffline) {
            AppSnackbars.showWarning(
              context,
              '${context.tr('login_success')} - ${context.tr('offline_mode_banner')}',
            );
          } else {
            AppSnackbars.showSuccess(
              context,
              '${context.tr('login_success')}: ${state.session.user.fullName}',
            );
          }
          // الانتقال إلى الصفحة الرئيسية
          context.go('/home');
        }
      },
      child: Scaffold(
        backgroundColor: colors.surface,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 880;

            if (isDesktop) {
              return _buildDesktopLayout(context);
            } else {
              return _buildMobileLayout(context, constraints);
            }
          },
        ),
      ),
    );
  }

  /// تخطيط الشاشات الكبيرة (Desktop / Web / Tablet Landscape)
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // القسم الأيسر: لوحة الهوية البصرية والمميزات
        const Expanded(
          flex: 5,
          child: LoginBrandingPanel(),
        ),

        // القسم الأيمن: نموذج الدخول مع مبدلات الثيم واللغة العلوية
        Expanded(
          flex: 6,
          child: Stack(
            children: [
              // مبدلات الثيم واللغة بالأعلى
              const Positioned(
                top: 24,
                right: 28,
                child: SafeArea(
                  child: AppFadeSlide(
                    delay: Duration(milliseconds: 150),
                    child: AppThemeLanguageSwitchers(
                      compact: false,
                      spacing: 8,
                    ),
                  ),
                ),
              ),

              // نموذج تسجيل الدخول متمركز
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48.0,
                    vertical: 60.0,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 440),
                    child: const AppFadeSlide(
                      delay: Duration(milliseconds: 100),
                      scaleIn: true,
                      child: LoginFormCard(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// تخطيط الشاشات الصغيرة (Mobile / Tablet Portrait)
  Widget _buildMobileLayout(BuildContext context, BoxConstraints constraints) {
    final colors = context.colors;

    return SafeArea(
      child: Stack(
        children: [
          // شريط علوي لمبدلات الثيم واللغة
          const Positioned(
            top: 12,
            right: 16,
            left: 16,
            child: AppFadeSlide(
              delay: Duration(milliseconds: 50),
              child: AppThemeLanguageSwitchers(
                spread: true,
                compact: true,
              ),
            ),
          ),

          // المحتوى التمريري المتمركز
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 440),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // شعار الفتح في الموبايل
                    const AppFadeSlide(
                      delay: Duration(milliseconds: 80),
                      scaleIn: true,
                      child: AppLogo(
                        size: 72,
                        withContainer: true,
                        isCircle: true,
                        withGlow: true,
                        padding: EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(height: 14),

                    AppFadeSlide(
                      delay: const Duration(milliseconds: 130),
                      child: Text(
                        context.tr('app_name'),
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontFamily: AppAssets.fontSecondary,
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // بطاقة النموذج
                    const AppFadeSlide(
                      delay: Duration(milliseconds: 180),
                      child: AppCard(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 26,
                        ),
                        child: LoginFormCard(),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // شارة الحماية السفلية
                    AppFadeSlide(
                      delay: const Duration(milliseconds: 230),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.lock_outline_rounded,
                            size: 14,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              context.tr('security_badge'),
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.labelSmall?.copyWith(
                                fontFamily: AppAssets.fontPrimary,
                                color: colors.onSurfaceVariant.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
