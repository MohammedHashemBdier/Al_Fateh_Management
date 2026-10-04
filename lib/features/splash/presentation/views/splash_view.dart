import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _scaleAnimation = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.65, curve: Curves.easeOutBack),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _animController.forward();
    context.read<SplashCubit>().initializeApp();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = context.isDark;
    final isArabic = context.isArabic;

    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashCompleted) {
          context.go(state.targetRoute);
        }
      },
      child: AppScaffold(
        useDefaultAppBar: false,
        applyPadding: false,
        withGradientBackground: false,
        body: Stack(
          children: [
            // خلفية متدرجة حديثة تتكيف مع الثيم
            Positioned.fill(
              child: AnimatedContainer(
                duration: AppDurations.medium,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colors.surfaceContainerLowest,
                      colors.surfaceContainerLow,
                      colors.surface,
                    ],
                  ),
                ),
              ),
            ),

            // تأثير إضاءة محيطية خلفية ناعمة
            Positioned(
              top: -120,
              right: isArabic ? null : -120,
              left: isArabic ? -120 : null,
              child: Container(
                width: 380,
                height: 380,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.primary.withValues(alpha: isDark ? 0.18 : 0.12),
                  boxShadow: [
                    BoxShadow(
                      color: colors.primary.withValues(alpha: isDark ? 0.25 : 0.15),
                      blurRadius: 160,
                      spreadRadius: 60,
                    ),
                  ],
                ),
              ),
            ),

            // أدوات التحكم السريعة بالأعلى (أزرار اللغة والثيم الموحدة والمجردة)
            SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge, vertical: AppDimens.paddingMedium),
                child: AppThemeLanguageSwitchers(
                  spread: true,
                  themeIconSize: AppDimens.iconMedium,
                ),
              ),
            ),

            // المحتوى الرئيسي المتمركز
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 580),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingXLarge),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // اللوجو المخصص مع أنيميشن التكبير والظهور
                      AnimatedBuilder(
                        animation: _animController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Opacity(
                              opacity: _fadeAnimation.value,
                              child: const AppLogo(
                                size: 160,
                                withContainer: true,
                                isCircle: true,
                                withGlow: true,
                                padding: EdgeInsets.all(26),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: AppDimens.spacingXLarge),

                      // اسم المنظومة
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: AppText.headline(
                          'app_name',
                          textAlign: TextAlign.center,
                          color: colors.onSurface,
                        ),
                      ),
                      SizedBox(height: AppDimens.spacingSmall),

                      // الوصف الفرعي
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: AppText.body(
                          'app_subtitle',
                          textAlign: TextAlign.center,
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 48),

                      // شريط التحميل وحالة التهيئة
                      BlocBuilder<SplashCubit, SplashState>(
                        builder: (context, state) {
                          double progress = 0.0;
                          String message = context.tr('splash_loading');

                          if (state is SplashLoading) {
                            progress = state.progress;
                            message = context.tr(state.statusKey);
                          } else if (state is SplashCompleted) {
                            progress = 1.0;
                            message = context.tr('splash_step_completed');
                          }

                          return Column(
                            children: [
                              SizedBox(
                                width: 280,
                                height: 5,
                                child: ClipRRect(
                                  borderRadius: AppRadii.full,
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(
                                        begin: 0.0, end: progress),
                                    duration:
                                        AppDurations.normal,
                                    curve: AppCurves.standard,
                                    builder: (context, value, _) {
                                      return LinearProgressIndicator(
                                        value: value,
                                        backgroundColor: colors
                                            .surfaceContainerHighest
                                            .withValues(alpha: 0.5),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          colors.primary,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: AppDimens.spacingMedium),
                              AnimatedSwitcher(
                                duration: AppDurations.fast,
                                child: AppText.bodySmall(
                                  message,
                                  key: ValueKey<String>(message),
                                  isTranslated: false,
                                  color: colors.onSurfaceVariant
                                      .withValues(alpha: 0.8),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // تذييل الشاشة بالإصدار
            Positioned(
              bottom: AppDimens.paddingLarge,
              left: 0,
              right: 0,
              child: Center(
                child: AppText.caption(
                  'splash_version',
                  color: colors.onSurfaceVariant.withValues(alpha: 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
