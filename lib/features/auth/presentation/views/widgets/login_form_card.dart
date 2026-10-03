import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/utils/app_snackbars.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_checkbox.dart';
import '../../../../../core/widgets/app_link.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/app_tooltip.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_state.dart';
import 'login_skeleton_card.dart';

/// بطاقة نموذج تسجيل الدخول المتجاوبة مع دعم Hover و MVVM
class LoginFormCard extends StatefulWidget {
  const LoginFormCard({super.key});

  @override
  State<LoginFormCard> createState() => _LoginFormCardState();
}

class _LoginFormCardState extends State<LoginFormCard> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    // فحص إن وجد اسم مستخدم محفوظ مسبقاً
    final state = context.read<LoginCubit>().state;
    if (state is LoginInitial && state.initialUsername != null) {
      _usernameController.text = state.initialUsername!;
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().login(
            username: _usernameController.text,
            password: _passwordController.text,
          );
    }
  }

  void _showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          context.tr('forgot_password'),
          style: const TextStyle(
            fontFamily: AppAssets.fontSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          context.tr('forgot_password_desc'),
          style: const TextStyle(fontFamily: AppAssets.fontPrimary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              context.tr('close'),
              style: const TextStyle(fontFamily: AppAssets.fontPrimary),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openWhatsAppSupport(BuildContext context) async {
    final uri = Uri.parse('https://wa.me/963953220081');
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context.mounted) {
        AppSnackbars.showWarning(context, context.tr('whatsapp_launch_error'));
      }
    } catch (_) {
      if (context.mounted) {
        AppSnackbars.showWarning(context, context.tr('whatsapp_launch_error'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginInitial && state.initialUsername != null) {
          if (_usernameController.text.isEmpty) {
            _usernameController.text = state.initialUsername!;
          }
        }
      },
      builder: (context, state) {
        // عند التحميل أو المصادقة، يظهر الهيكل العظمي (Skeleton) تلقائياً
        if (state is LoginLoading || (state is LoginInitial && state.isSkeletonPreview)) {
          return const LoginSkeletonCard();
        }

        final isLoading = state is LoginLoading;
        final rememberMe = state is LoginInitial ? state.rememberMe : true;

        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // عنوان الشاشة
              Text(
                context.tr('login_title'),
                style: context.textTheme.headlineSmall?.copyWith(
                  fontFamily: AppAssets.fontSecondary,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                context.tr('login_subtitle'),
                style: context.textTheme.bodyMedium?.copyWith(
                  fontFamily: AppAssets.fontPrimary,
                  color: colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 28),

              // حقل اسم المستخدم
              AppTextField(
                controller: _usernameController,
                label: context.tr('username'),
                hint: context.tr('username_hint'),
                prefixIcon: Icons.person_outline_rounded,
                tooltip: context.tr('username_hint'),
                keyboardType: TextInputType.text,
                onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return context.tr('val_username_empty');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),

              // حقل كلمة المرور
              AppTextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                label: context.tr('password'),
                hint: context.tr('password_hint'),
                prefixIcon: Icons.lock_outline_rounded,
                isPassword: true,
                onFieldSubmitted: (_) => _submit(),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return context.tr('val_password_empty');
                  }
                  if (val.length < 4) {
                    return context.tr('val_password_short');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // صف تذكرني ونسيت كلمة المرور بتخطيط متجاوب لا يفيض
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 10,
                children: [
                  AppTooltip(
                    message: context.tr('remember_me_tooltip'),
                    child: AppCheckbox(
                      value: rememberMe,
                      label: context.tr('remember_me'),
                      onChanged: isLoading
                          ? null
                          : (val) => context
                              .read<LoginCubit>()
                              .toggleRememberMe(val ?? true),
                    ),
                  ),
                  AppLink(
                    text: context.tr('forgot_password'),
                    onTap: () => _showForgotPasswordDialog(context),
                  ),
                ],
              ),
              const SizedBox(height: 26),

              // زر تسجيل الدخول
              AppButton(
                label: isLoading
                    ? context.tr('signing_in')
                    : context.tr('sign_in'),
                icon: isLoading ? null : Icons.login_rounded,
                isLoading: isLoading,
                width: double.infinity,
                height: 48,
                tooltip: context.tr('sign_in'),
                onPressed: isLoading ? null : _submit,
              ),
              const SizedBox(height: 20),

              // زر التواصل مع الإدارة عبر واتساب
              Center(
                child: AppLink(
                  text: context.tr('contact_admin'),
                  icon: Icons.chat_outlined,
                  onTap: () => _openWhatsAppSupport(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
