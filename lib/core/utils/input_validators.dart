import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

class InputValidators {
  InputValidators._();

  /// Validate required text field
  static String? requiredField(
    String? value, {
    BuildContext? context,
    String? customMessage,
  }) {
    if (value == null || value.trim().isEmpty) {
      if (customMessage != null) return customMessage;
      return context?.tr('val_required') ?? 'هذا الحقل مطلوب';
    }
    return null;
  }

  /// Validate landline phone number (الرقم الأرضي)
  static String? validateLandline(String? value, {BuildContext? context}) {
    if (value == null || value.trim().isEmpty) {
      return context?.tr('val_landline_empty') ?? 'يرجى إدخال الرقم الأرضي';
    }
    final cleanValue = value.replaceAll(RegExp(r'\s+'), '');
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanValue)) {
      return context?.tr('val_landline_digits') ??
          'الرقم الأرضي يجب أن يحتوي على أرقام فقط';
    }
    if (cleanValue.length < 6 || cleanValue.length > 10) {
      return context?.tr('val_landline_length') ??
          'طول الرقم الأرضي غير صحيح (بين 6 و 10 أرقام)';
    }
    return null;
  }

  /// Validate subscriber name (اسم المشترك)
  static String? validateSubscriberName(String? value, {BuildContext? context}) {
    if (value == null || value.trim().isEmpty) {
      return context?.tr('val_subscriber_empty') ?? 'يرجى إدخال اسم المشترك';
    }
    if (value.trim().length < 3) {
      return context?.tr('val_subscriber_length') ??
          'اسم المشترك قصير جداً (3 أحرف على الأقل)';
    }
    return null;
  }

  /// Validate mobile number
  static String? validateMobile(String? value, {BuildContext? context}) {
    if (value == null || value.trim().isEmpty) {
      return context?.tr('val_mobile_empty') ?? 'يرجى إدخال رقم الهاتف المحمول';
    }
    final cleanValue = value.replaceAll(RegExp(r'\s+'), '');
    if (!RegExp(r'^(09|\+9639)[0-9]{8}$').hasMatch(cleanValue)) {
      return context?.tr('val_mobile_invalid') ??
          'يرجى إدخال رقم محمول صحيح (مثال: 09xxxxxxxx)';
    }
    return null;
  }
}
