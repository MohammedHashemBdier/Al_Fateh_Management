import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompact = context.isMobile;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ترويسة ترحيبية
            AppCard(
              padding: EdgeInsets.all(isCompact ? 16.0 : 22.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr('welcome_admin'),
                          style: (isCompact
                                  ? context.textTheme.titleMedium
                                  : context.textTheme.headlineSmall)
                              ?.copyWith(
                            fontFamily: AppAssets.fontSecondary,
                            fontWeight: FontWeight.bold,
                            color: colors.primary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          context.tr('app_subtitle'),
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontFamily: AppAssets.fontPrimary,
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  CircleAvatar(
                    radius: isCompact ? 24 : 30,
                    backgroundColor: colors.primaryContainer,
                    child: Icon(
                      Icons.admin_panel_settings_rounded,
                      color: colors.onPrimaryContainer,
                      size: isCompact ? 26 : 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // عنوان شبكة الخدمات الإدارية
            AppHeaderTitle(
              title: context.tr('services_title'),
              icon: Icons.dashboard_customize_rounded,
            ),
            const SizedBox(height: 16),

            // شبكة الخدمات المتجاوبة
            ResponsiveBuilder(
              desktop: (context) => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                childAspectRatio: 2.2,
                children: _buildServiceItems(context),
              ),
              mobile: (context) => Column(
                children: _buildServiceItems(context)
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 14.0),
                          child: item,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildServiceItems(BuildContext context) {
    return [
      _buildServiceCard(
        context: context,
        title: context.tr('service_support'),
        desc: context.tr('service_support_desc'),
        icon: Icons.support_agent_rounded,
        isActive: true,
        badgeText: context.tr('active_now'),
        onTap: () {
          AppSnackbars.showInfo(
            context,
            '${context.tr('service_support')} - ${context.tr('service_support_loading')}',
          );
        },
      ),
      _buildServiceCard(
        context: context,
        title: context.tr('service_subscribers'),
        desc: context.tr('service_subscribers_desc'),
        icon: Icons.people_alt_rounded,
        isActive: false,
        badgeText: context.tr('coming_soon'),
      ),
      _buildServiceCard(
        context: context,
        title: context.tr('service_network'),
        desc: context.tr('service_network_desc'),
        icon: Icons.settings_ethernet_rounded,
        isActive: false,
        badgeText: context.tr('coming_soon'),
      ),
      _buildServiceCard(
        context: context,
        title: context.tr('service_billing'),
        desc: context.tr('service_billing_desc'),
        icon: Icons.account_balance_wallet_rounded,
        isActive: false,
        badgeText: context.tr('coming_soon'),
      ),
    ];
  }

  Widget _buildServiceCard({
    required BuildContext context,
    required String title,
    required String desc,
    required IconData icon,
    required bool isActive,
    required String badgeText,
    VoidCallback? onTap,
  }) {
    final colors = context.colors;

    return AppCard(
      onTap: onTap,
      borderColor: isActive ? colors.primary.withValues(alpha: 0.4) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isActive
                      ? colors.primaryContainer
                      : colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: isActive
                      ? colors.onPrimaryContainer
                      : colors.onSurfaceVariant,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: AppAssets.fontSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppStatusBadge(status: badgeText),
              if (isActive)
                Row(
                  children: [
                    Text(
                      context.tr('enter_service'),
                      style: TextStyle(
                        fontFamily: AppAssets.fontPrimary,
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 13,
                      color: colors.primary,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
