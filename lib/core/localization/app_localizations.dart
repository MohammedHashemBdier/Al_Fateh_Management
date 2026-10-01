import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('ar'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  bool get isArabic => locale.languageCode == 'ar';

  static final Map<String, Map<String, String>> _localizedValues = {
    'ar': {
      // General & Actions
      'app_name': 'إدارة مزود خدمة الانترنت الفتح',
      'app_subtitle': 'المنظومة الإدارية المتكاملة لخدمات الإنترنت',
      'welcome_admin': 'مرحباً بك في لوحة تحكم شركة الفتح',
      'status_connected': 'متصل بالسيرفر',
      'status_connected_short': 'متصل',
      'theme_dark': 'الوضع الليلي',
      'theme_light': 'الوضع النهاري',
      'lang_switch': 'English',
      'confirm': 'تأكيد',
      'cancel': 'إلغاء',
      'close': 'إغلاق',
      'save': 'حفظ',
      'delete': 'حذف',
      'edit': 'تعديل',
      'search': 'بحث',
      'filter': 'فلترة',
      'refresh': 'تحديث',
      'back': 'رجوع',
      'or': 'أو',

      // Splash Screen
      'splash_loading': 'جاري تهيئة منظومة الفتح...',
      'splash_version': 'الإصدار 1.0.0 الموحد',
      'splash_step_resources': 'تحميل الموارد والخطوط...',
      'splash_step_network': 'فحص إعدادات الاتصال بالسيرفر...',
      'splash_step_system': 'تهيئة منظومة إدارة الفتح...',
      'splash_step_completed': 'اكتملت التهيئة بنجاح',

      // Services Hub
      'services_title': 'الخدمات الإدارية للمزود',
      'service_support': 'قسم الدعم الفني والمتابعات',
      'service_support_desc': 'متابعة اتصالات المشتركين، حل الأعطال، والمزامنة اللحظية مع Google Sheets',
      'service_support_loading': 'جاري إعداد التذاكر وجدول المتابعة...',
      'service_subscribers': 'إدارة المشتركين والخطوط',
      'service_subscribers_desc': 'سجلات الحسابات، الباقات، وتجديد الاشتراكات',
      'service_network': 'مراقبة الشبكة والمقاسم',
      'service_network_desc': 'مراقبة استقرار الخدمة، جودة الخطوط، وأداء السيرفرات',
      'service_billing': 'الفواتير والحسابات المالية',
      'service_billing_desc': 'إدارة المقبوضات الشهرية، الذمم، والتقارير المالية للمزود',
      'coming_soon': 'قيد التطوير',
      'active_now': 'نشط ومتاح',
      'enter_service': 'دخول القسم',

      // Technical Support & Tickets
      'status_resolved': 'تم الحل',
      'status_in_progress': 'قيد الحل',
      'status_unresolved': 'لم يتم الحل',
      'ticket_new': 'تسجيل تذكرة جديدة',
      'ticket_number': 'رقم التذكرة',
      'subscriber_name': 'اسم المشترك',
      'landline_number': 'الرقم الأرضي',
      'problem_type': 'نوع المشكلة',
      'solution_method': 'طريقة الحل',
      'description': 'التوصيف',
      'employee': 'الموظف',
      'date': 'التاريخ',
      'time': 'الوقت',
      'actions': 'الإجراءات',
      'no_data': 'لا توجد بيانات متاحة حالياً',

      // Form Validation
      'val_required': 'هذا الحقل مطلوب',
      'val_landline_empty': 'يرجى إدخال الرقم الأرضي',
      'val_landline_digits': 'الرقم الأرضي يجب أن يحتوي على أرقام فقط',
      'val_landline_length': 'طول الرقم الأرضي غير صحيح (بين 6 و 10 أرقام)',
      'val_subscriber_empty': 'يرجى إدخال اسم المشترك',
      'val_subscriber_length': 'اسم المشترك قصير جداً (3 أحرف على الأقل)',
      'val_mobile_empty': 'يرجى إدخال رقم الهاتف المحمول',
      'val_mobile_invalid': 'يرجى إدخال رقم محمول صحيح (مثال: 09xxxxxxxx)',
    },
    'en': {
      // General & Actions
      'app_name': 'Al-Fateh ISP Management',
      'app_subtitle': 'Integrated Internet Services Management System',
      'welcome_admin': 'Welcome to Al-Fateh Control Center',
      'status_connected': 'Server Connected',
      'status_connected_short': 'Connected',
      'theme_dark': 'Dark Mode',
      'theme_light': 'Light Mode',
      'lang_switch': 'العربية',
      'confirm': 'Confirm',
      'cancel': 'Cancel',
      'close': 'Close',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'search': 'Search',
      'filter': 'Filter',
      'refresh': 'Refresh',
      'back': 'Back',
      'or': 'Or',

      // Splash Screen
      'splash_loading': 'Initializing Al-Fateh System...',
      'splash_version': 'Version 1.0.0 Unified',
      'splash_step_resources': 'Loading resources and typography...',
      'splash_step_network': 'Verifying server connection settings...',
      'splash_step_system': 'Configuring Al-Fateh Management System...',
      'splash_step_completed': 'Initialization completed successfully',

      // Services Hub
      'services_title': 'ISP Administrative Services',
      'service_support': 'Technical Support & Follow-up',
      'service_support_desc': 'Track subscriber calls, resolve tickets, and real-time Google Sheets sync',
      'service_support_loading': 'Preparing tickets and follow-up table...',
      'service_subscribers': 'Subscribers & Lines Management',
      'service_subscribers_desc': 'Account records, packages, and subscription renewal',
      'service_network': 'Network & DSLAM Monitoring',
      'service_network_desc': 'Monitor service stability, line quality, and server performance',
      'service_billing': 'Billing & Financial Accounts',
      'service_billing_desc': 'Monthly collections, receivables, and ISP financial reports',
      'coming_soon': 'Under Development',
      'active_now': 'Active & Available',
      'enter_service': 'Open Service',

      // Technical Support & Tickets
      'status_resolved': 'Resolved',
      'status_in_progress': 'In Progress',
      'status_unresolved': 'Unresolved',
      'ticket_new': 'New Ticket',
      'ticket_number': 'Ticket #',
      'subscriber_name': 'Subscriber Name',
      'landline_number': 'Landline Number',
      'problem_type': 'Problem Type',
      'solution_method': 'Resolution Method',
      'description': 'Description',
      'employee': 'Employee',
      'date': 'Date',
      'time': 'Time',
      'actions': 'Actions',
      'no_data': 'No data available at the moment',

      // Form Validation
      'val_required': 'This field is required',
      'val_landline_empty': 'Please enter landline number',
      'val_landline_digits': 'Landline must contain digits only',
      'val_landline_length': 'Invalid landline length (6-10 digits)',
      'val_subscriber_empty': 'Please enter subscriber name',
      'val_subscriber_length': 'Subscriber name is too short (min 3 chars)',
      'val_mobile_empty': 'Please enter mobile phone number',
      'val_mobile_invalid': 'Please enter a valid mobile number (e.g. 09xxxxxxxx)',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        _localizedValues['ar']?[key] ??
        key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension LocalizationExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
  String tr(String key) => loc.translate(key);
}
