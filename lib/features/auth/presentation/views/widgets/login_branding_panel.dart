import 'package:flutter/material.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/app_animations.dart';
import '../../../../../core/widgets/app_logo.dart';

/// اللوحة الترويجية والهوية البصرية المعروضة على الشاشات الكبيرة (Desktop / Web)
class LoginBrandingPanel extends StatelessWidget {
  const LoginBrandingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = context.isDark;
    final isArabic = context.isArabic;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.surfaceContainerLowest,
            colors.surfaceContainerLow,
            colors.surfaceContainer,
          ],
        ),
      ),
      child: Stack(
        children: [
          // إضاءة خلفية ناعمة
          Positioned(
            top: -60,
            right: isArabic ? -60 : null,
            left: isArabic ? null : -60,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primary.withValues(alpha: isDark ? 0.18 : 0.10),
                boxShadow: [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: isDark ? 0.25 : 0.12),
                    blurRadius: 140,
                    spreadRadius: 40,
                  ),
                ],
              ),
            ),
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              final minH = constraints.maxHeight > 80 ? constraints.maxHeight - 80 : 0.0;
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 40.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: minH),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // الشعار العلوي
                      AppFadeSlide(
                        delay: const Duration(milliseconds: 60),
                        offset: const Offset(0.0, 0.05),
                        child: Row(
                          children: [
                            const AppLogo(
                              size: 48,
                              withContainer: true,
                              isCircle: true,
                              padding: EdgeInsets.all(8),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.tr('app_name'),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: AppAssets.fontSecondary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: colors.onSurface,
                                    ),
                                  ),
                                  Text(
                                    context.tr('app_subtitle'),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: AppAssets.fontPrimary,
                                      fontSize: 12,
                                      color: colors.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // النص الترحيبي والمميزات
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppFadeSlide(
                            delay: const Duration(milliseconds: 140),
                            child: Text(
                              context.tr('welcome_admin'),
                              style: TextStyle(
                                fontFamily: AppAssets.fontSecondary,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: colors.onSurface,
                                height: 1.4,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          AppFadeSlide(
                            delay: const Duration(milliseconds: 200),
                            child: Text(
                              context.tr('login_brand_desc'),
                              style: TextStyle(
                                fontFamily: AppAssets.fontPrimary,
                                fontSize: 14,
                                color: colors.onSurfaceVariant,
                                height: 1.6,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),

                          // مزايا المنظومة
                          AppFadeSlide(
                            delay: const Duration(milliseconds: 260),
                            child: _buildFeatureItem(
                              context: context,
                              icon: Icons.speed_rounded,
                              title: context.tr('feature_tickets_title'),
                              subtitle: context.tr('feature_tickets_desc'),
                            ),
                          ),
                          const SizedBox(height: 18),
                          AppFadeSlide(
                            delay: const Duration(milliseconds: 320),
                            child: _buildFeatureItem(
                              context: context,
                              icon: Icons.location_on_rounded,
                              title: context.tr('feature_geofence_title'),
                              subtitle: context.tr('feature_geofence_desc'),
                            ),
                          ),
                          const SizedBox(height: 18),
                          AppFadeSlide(
                            delay: const Duration(milliseconds: 380),
                            child: _buildFeatureItem(
                              context: context,
                              icon: Icons.security_rounded,
                              title: context.tr('feature_rbac_title'),
                              subtitle: context.tr('feature_rbac_desc'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // شارة الحماية السفلية
                      AppFadeSlide(
                        delay: const Duration(milliseconds: 440),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: colors.surfaceContainerHighest.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: colors.outlineVariant.withValues(alpha: 0.4),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.lock_outline_rounded, size: 16, color: colors.success),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  context.tr('security_badge'),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: AppAssets.fontPrimary,
                                    fontSize: 12,
                                    color: colors.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final colors = context.colors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: colors.primary, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: AppAssets.fontPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: AppAssets.fontPrimary,
                  fontSize: 12,
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
