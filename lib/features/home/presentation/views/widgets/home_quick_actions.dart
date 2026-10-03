import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/rbac/role_permissions.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/core/widgets/app_animations.dart';
import 'package:al_fateh_management/core/widgets/app_card.dart';
import 'package:al_fateh_management/core/widgets/app_hover.dart';
import 'package:al_fateh_management/core/widgets/app_tooltip.dart';
import 'package:al_fateh_management/core/widgets/role_gate.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';

/// قسم الإجراءات السريعة المخصص والمفلتر حسب الصلاحيات (Role-Based Quick Actions)
class HomeQuickActions extends StatelessWidget {
  final UserModel user;

  const HomeQuickActions({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final role = UserRole.fromCode(user.roleId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('stat_quick_actions'),
          style: context.textTheme.titleMedium?.copyWith(
            fontFamily: AppAssets.fontSecondary,
            fontWeight: FontWeight.bold,
            color: context.colors.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            // تسجيل تذكرة جديدة (فني، مبيعات، إدارة)
            RoleGate(
              userRole: role,
              allowedRoles: const [
                UserRole.support,
                UserRole.supportManager,
                UserRole.sales,
                UserRole.salesManager,
                UserRole.admin,
              ],
              child: _buildActionButton(
                context: context,
                labelKey: 'action_new_ticket',
                icon: Icons.add_task_rounded,
                color: const Color(0xff3b82f6),
                delay: const Duration(milliseconds: 100),
                onTap: () => context.go('/tickets'),
              ),
            ),

            // تسجيل الحضور والدوام (الموظفون الميدانيون والمكتبيون)
            RoleGate(
              userRole: role,
              allowedRoles: const [
                UserRole.support,
                UserRole.sales,
                UserRole.finance,
                UserRole.supportManager,
                UserRole.salesManager,
              ],
              child: _buildActionButton(
                context: context,
                labelKey: 'action_check_in',
                icon: Icons.fingerprint_rounded,
                color: const Color(0xff10b981),
                delay: const Duration(milliseconds: 160),
                onTap: () => context.go('/attendance'),
              ),
            ),

            // إدارة الموظفين والصلاحيات (أدمن، مدير عام)
            RoleGate(
              userRole: role,
              allowedRoles: const [
                UserRole.admin,
                UserRole.generalManager,
              ],
              child: _buildActionButton(
                context: context,
                labelKey: 'action_manage_users',
                icon: Icons.manage_accounts_rounded,
                color: const Color(0xff8b5cf6),
                delay: const Duration(milliseconds: 220),
                onTap: () => context.go('/employees'),
              ),
            ),

            // تدقيق الرواتب والدوام المالي (مالية، مدير عام)
            RoleGate(
              userRole: role,
              allowedRoles: const [
                UserRole.finance,
                UserRole.generalManager,
              ],
              child: _buildActionButton(
                context: context,
                labelKey: 'action_payroll_audit',
                icon: Icons.account_balance_wallet_rounded,
                color: const Color(0xfff59e0b),
                delay: const Duration(milliseconds: 280),
                onTap: () => context.go('/attendance'),
              ),
            ),

            // إعدادات الحساب والتطبيق (متاح للجميع)
            _buildActionButton(
              context: context,
              labelKey: 'action_settings',
              icon: Icons.settings_suggest_rounded,
              color: const Color(0xff64748b),
              delay: const Duration(milliseconds: 340),
              onTap: () => context.go('/settings'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String labelKey,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    Duration delay = Duration.zero,
  }) {
    return AppFadeSlide(
      delay: delay,
      child: AppTooltip(
        message: context.tr(labelKey),
        child: AppHover(
          builder: (ctx, isHovered) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: Matrix4.translationValues(0, isHovered ? -2 : 0, 0),
              child: AppCard(
                onTap: onTap,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                borderRadius: 14,
                borderColor: isHovered ? color.withValues(alpha: 0.6) : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: isHovered ? 0.2 : 0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: color, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        context.tr(labelKey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: AppAssets.fontPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: context.colors.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
