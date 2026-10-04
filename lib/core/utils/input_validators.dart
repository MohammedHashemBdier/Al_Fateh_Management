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

  /// Validate landline phone number (الرقم الأرضي / الهاتف)
  static String? validateLandline(String? value, {BuildContext? context}) {
    if (value == null || value.trim().isEmpty) {
      return context?.tr('val_landline_empty') ?? 'يرجى إدخال رقم الهاتف';
    }
    final cleanValue = value.replaceAll(RegExp(r'\s+'), '');
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanValue)) {
      return context?.tr('val_landline_digits') ??
          'رقم الهاتف يجب أن يحتوي على أرقام فقط';
    }
    if (cleanValue.length != 10) {
      return context?.tr('val_landline_length') ??
          'رقم الهاتف يجب أن يتألف من 10 أرقام تماماً';
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
  static String? validateMobile(
    String? value, {
    BuildContext? context,
    bool isRequired = false,
  }) {
    if (value == null || value.trim().isEmpty) {
      if (isRequired) {
        return context?.tr('val_mobile_empty') ??
            'يرجى إدخال رقم الهاتف المحمول';
      }
      return null;
    }
    final cleanValue = value.replaceAll(RegExp(r'\s+'), '');
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanValue)) {
      return context?.tr('val_landline_digits') ??
          'رقم الموبايل يجب أن يحتوي على أرقام فقط';
    }
    if (cleanValue.length != 10) {
      return context?.tr('val_mobile_invalid') ??
          'رقم الموبايل يجب أن يتألف من 10 أرقام (مثال: 09xxxxxxxx)';
    }
    return null;
  }
}
