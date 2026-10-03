import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/core/widgets/app_app_bar.dart';
import 'package:al_fateh_management/core/widgets/app_button.dart';
import 'package:al_fateh_management/core/widgets/app_card.dart';
import 'package:al_fateh_management/core/widgets/app_scaffold.dart';
import 'package:al_fateh_management/core/widgets/app_status_badge.dart';

/// واجهة إدارة المتابعات الفنية والأعطال (Tickets View)
class TicketsView extends StatelessWidget {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppScaffold(
      appBar: AppAppBar(
        title: context.tr('tickets_view_title'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          tooltip: context.tr('back'),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: AppCard(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: colors.primaryContainer,
                    child: Icon(
                      Icons.support_agent_rounded,
                      size: 42,
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context.tr('tickets_view_title'),
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontFamily: AppAssets.fontSecondary,
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    context.tr('tickets_view_desc'),
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontFamily: AppAssets.fontPrimary,
                      color: colors.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppStatusBadge(status: context.tr('coming_soon')),
                  const SizedBox(height: 28),
                  AppButton(
                    label: context.tr('back'),
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.go('/home'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
