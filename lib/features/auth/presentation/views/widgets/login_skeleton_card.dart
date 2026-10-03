import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_skeleton.dart';

/// بطاقة هيكلية نابضة (Skeleton Loader) تمثل شاشة تسجيل الدخول أثناء التحميل
class LoginSkeletonCard extends StatelessWidget {
  const LoginSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        // عنوان الشاشة والوصف الهيكلي
        AppSkeleton.text(width: 180, height: 26),
        SizedBox(height: 10),
        AppSkeleton.text(width: 280, height: 14),
        SizedBox(height: 32),

        // حقل اسم المستخدم
        AppSkeleton.text(width: 100, height: 14),
        SizedBox(height: 8),
        AppSkeleton.input(),
        SizedBox(height: 20),

        // حقل كلمة المرور
        AppSkeleton.text(width: 90, height: 14),
        SizedBox(height: 8),
        AppSkeleton.input(),
        SizedBox(height: 18),

        // تذكرني ونسيت كلمة المرور
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppSkeleton.text(width: 130, height: 16),
            AppSkeleton.text(width: 100, height: 16),
          ],
        ),
        SizedBox(height: 28),

        // زر تسجيل الدخول
        AppSkeleton.button(height: 48),
        SizedBox(height: 24),

        // شارة الحماية الهيكلية
        Center(
          child: AppSkeleton.text(width: 160, height: 12),
        ),
      ],
    );
  }
}
