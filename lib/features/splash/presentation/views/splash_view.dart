import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_assets.dart';
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
          context.go('/home');
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            // خلفية متدرجة حديثة تتكيف مع الثيم
            Positioned.fill(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [
                            const Color(0xff0d131f),
                            const Color(0xff141c2c),
                            const Color(0xff1b263b),
                          ]
                        : [
                            const Color(0xfff8faff),
                            const Color(0xffeef3fb),
                            const Color(0xffe3ecf8),
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
                  color: isDark
                      ? const Color(0xff904a4b).withValues(alpha: 0.18)
                      : const Color(0xffa15858).withValues(alpha: 0.12),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? const Color(0xff904a4b).withValues(alpha: 0.25)
                          : const Color(0xffa15858).withValues(alpha: 0.15),
                      blurRadius: 160,
                      spreadRadius: 60,
                    ),
                  ],
                ),
              ),
            ),

            // أدوات التحكم السريعة بالأعلى (أزرار اللغة والثيم الموحدة والمجردة)
            const SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: AppThemeLanguageSwitchers(
                  spread: true,
                  themeIconSize: 22,
                ),
              ),
            ),

            // المحتوى الرئيسي المتمركز
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 580),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                      const SizedBox(height: 36),

                      // اسم المنظومة
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          context.tr('app_name'),
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontFamily: AppAssets.fontSecondary,
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                            letterSpacing: isArabic ? 0 : 0.8,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // الوصف الفرعي
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          context.tr('app_subtitle'),
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontFamily: AppAssets.fontPrimary,
                            color: colors.onSurfaceVariant,
                            letterSpacing: 0.3,
                          ),
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
                                  borderRadius: BorderRadius.circular(10),
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(
                                        begin: 0.0, end: progress),
                                    duration:
                                        const Duration(milliseconds: 350),
                                    curve: Curves.easeInOut,
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
                              const SizedBox(height: 14),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 250),
                                child: Text(
                                  message,
                                  key: ValueKey<String>(message),
                                  style: context.textTheme.bodySmall?.copyWith(
                                    fontFamily: AppAssets.fontPrimary,
                                    color: colors.onSurfaceVariant
                                        .withValues(alpha: 0.8),
                                  ),
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
              bottom: 24,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  context.tr('splash_version'),
                  style: context.textTheme.labelSmall?.copyWith(
                    fontFamily: AppAssets.fontPrimary,
                    color: colors.onSurfaceVariant.withValues(alpha: 0.6),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
