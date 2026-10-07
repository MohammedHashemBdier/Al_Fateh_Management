import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/services/connectivity/i_connectivity_service.dart';
import '../../../../../core/utils/context_extensions.dart';

/// مؤشر لحالة الاتصال بالسيرفر والإنترنت (Online / Offline Indicator)
class ConnectionStatusIndicator extends StatelessWidget {
  final ConnectionStatus status;

  const ConnectionStatusIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isOnline = status == ConnectionStatus.online;

    final color = isOnline ? colors.success : colors.warning;
    final icon = isOnline ? Icons.wifi_rounded : Icons.wifi_off_rounded;
    final label = isOnline ? 'status_connected' : 'stat_offline_indicator';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.space10,
        vertical: AppDimens.space4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: AppRadii.full,
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: AppDimens.space6),
          Icon(icon, size: AppDimens.iconXs, color: color),
          const SizedBox(width: AppDimens.space4),
          Text(
            context.tr(label),
            style: TextStyle(
              fontFamily: AppAssets.fontPrimary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
