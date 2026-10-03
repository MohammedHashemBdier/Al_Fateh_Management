import 'package:flutter/material.dart';
import 'backend_message_translator.dart';

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
      'theme_system': 'ثيم الجهاز (تلقائي)',
      'theme_dark': 'الوضع الليلي',
      'theme_light': 'الوضع النهاري',
      'lang_system': 'لغة الجهاز (تلقائي)',
      'lang_ar': 'العربية',
      'lang_en': 'English',
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
      'logout': 'تسجيل الخروج',
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
      'val_username_empty': 'يرجى إدخال اسم المستخدم',
      'val_password_empty': 'يرجى إدخال كلمة المرور',
      'val_password_short': 'كلمة المرور قصيرة جداً (4 خانات على الأقل)',

      // Authentication & Login
      'login_title': 'تسجيل الدخول للمنظومة',
      'login_subtitle': 'أدخل بيانات حسابك للوصول إلى لوحة الإدارة والخدمات',
      'username': 'اسم المستخدم',
      'username_hint': 'مثال: admin أو hashem',
      'password': 'كلمة المرور',
      'password_hint': '••••••••',
      'remember_me': 'تذكرني على هذا الجهاز',
      'remember_me_tooltip': 'حفظ جلسة الدخول وتفعيل الوصول السريع بدون إنترنت',
      'sign_in': 'تسجيل الدخول',
      'signing_in': 'جاري التحقق والمصادقة...',
      'login_success': 'تم تسجيل الدخول بنجاح',
      'offline_mode_banner': 'تم الدخول في وضع عدم الاتصال (بيانات مخزنة محلياً)',
      'forgot_password': 'نسيت كلمة المرور؟',
      'forgot_password_desc': 'يرجى مراجعة إدارة منظومة الفتح لإعادة ضبط كلمة المرور',
      'show_password': 'إظهار كلمة المرور',
      'hide_password': 'إخفاء كلمة المرور',
      'need_help': 'تحتاج إلى مساعدة؟',
      'contact_admin': 'تواصل مع الدعم الفني والإدارة',
      'security_badge': 'اتصال آمن ومشفر 256-bit',
      'preview_skeleton': 'معاينة التحميل الهيكلي (Skeleton)',
      'login_brand_desc': 'بوابة التحكم الموحدة لخدمات تزويد الإنترنت، متابعات المشتركين، وجداول الدوام الذكية.',
      'feature_tickets_title': 'إدارة تذاكر الدعم الفني اللحظية',
      'feature_tickets_desc': 'مزامنة مباشرة مع Google Sheets وتحديث حالات المشتركين',
      'feature_geofence_title': 'الدوام الذكي مع التحقق الجغرافي (Geofence)',
      'feature_geofence_desc': 'حضور وانصراف دقيق داخل نطاق مقر ومقاسم الشركة',
      'feature_rbac_title': 'أمان متقدم ومصفوفة صلاحيات (RBAC)',
      'feature_rbac_desc': 'فصل مهام دقيق لجميع أقسام الشركة مع سجل تدقيق غير قابل للتعديل',
      'whatsapp_contact': 'تواصل مع الدعم الفني عبر واتساب',
      'whatsapp_launch_error': 'تعذر فتح تطبيق واتساب، يرجى المحاولة لاحقاً',
      'login_error_empty_fields': 'يرجى إدخال اسم المستخدم وكلمة المرور',
      'login_error_invalid_password': 'كلمة المرور غير صحيحة',
      'login_error_user_not_found': 'اسم المستخدم غير موجود',
      'login_error_account_disabled': 'تم تعطيل هذا الحساب، يرجى مراجعة إدارة الفتح',
      'login_error_network': 'تعذر الاتصال بالسيرفر، يرجى التحقق من اتصال الإنترنت',
      'login_error_generic': 'فشل تسجيل الدخول، يرجى التحقق من اسم المستخدم وكلمة المرور',

      // Navigation & Sections
      'nav_home': 'الرئيسية',
      'nav_tickets': 'المتابعات الفنية',
      'nav_attendance': 'سجل الدوام',
      'nav_employees': 'الموظفون والصلاحيات',
      'nav_settings': 'الإعدادات والحساب',

      // Confirm Dialog
      'confirm_logout_title': 'تأكيد تسجيل الخروج',
      'confirm_logout_msg': 'هل أنت متأكد من رغبتك في تسجيل الخروج من منظومة الفتح؟',
      'confirm_logout_button': 'تسجيل الخروج',

      // Dashboard & Statistics
      'stat_total_tickets': 'إجمالي التذاكر',
      'stat_in_progress': 'تذاكر قيد الحل',
      'stat_resolved_today': 'تم حلها اليوم',
      'stat_attendance_status': 'حالة دوام اليوم',
      'stat_present': 'حاضر بالعمل',
      'stat_not_checked_in': 'لم يسجل حضور',
      'stat_active_users': 'الموظفون النشطون',
      'stat_quick_actions': 'الإجراءات السريعة',
      'stat_recent_tickets': 'أحدث المتابعات المسجلة',
      'stat_view_all': 'عرض الكل',
      'stat_refresh_data': 'تحديث البيانات',
      'stat_offline_indicator': 'وضع محلي غير متصل بالشبكة',
      'action_new_ticket': 'تسجيل تذكرة',
      'action_check_in': 'تسجيل الحضور',
      'action_manage_users': 'إدارة الموظفين',
      'action_payroll_audit': 'تدقيق الرواتب',
      'action_settings': 'إعدادات الحساب',

      // Modules Placeholders
      'tickets_view_title': 'إدارة المتابعات الفنية والأعطال',
      'tickets_view_desc': 'متابعة اتصالات المشتركين، تسجيل الأعطال، وتحديث الحالات فورياً في جداول البيانات',
      'attendance_view_title': 'إدارة الحضور والانصراف والدوام',
      'attendance_view_desc': 'تسجيل الحضور عبر الـ GPS، التحقق من النطاق الجغرافي للمقر، ومراقبة الورديات والخصومات',
      'employees_view_title': 'إدارة الموظفين والحسابات والصلاحيات',
      'employees_view_desc': 'إدارة بيانات كادر العمل، مصفوفة الصلاحيات (RBAC)، واستعراض سجل التدقيق والرقابة',
      'settings_view_title': 'إعدادات التطبيق والحساب الشخصي',
      'settings_view_desc': 'إدارة تفضيلات المظهر واللغة، الأمان، وتفاصيل الحساب وجلسة الدخول',

      // User Roles
      'role_admin': 'أدمن النظام',
      'role_gm': 'المدير العام',
      'role_finance': 'المحاسبة والمالية',
      'role_support_manager': 'مدير الدعم الفني',
      'role_sales_manager': 'مدير المبيعات',
      'role_support': 'فني الدعم الفني',
      'role_sales': 'موظف المبيعات',

      // Errors
      'error_network_connection': 'لا يوجد اتصال بالإنترنت، يرجى فحص الشبكة',
      'error_network_timeout': 'انتهت مهلة انتظار استجابة الخادم',
      'error_server_internal': 'حدث خطأ غير متوقع في الخادم',
      'error_unauthorized': 'غير مصرح، يرجى إعادة تسجيل الدخول',
      'error_forbidden': 'ليس لديك الصلاحيات الكافية لتنفيذ هذا الإجراء',
      'error_not_found': 'العنصر المطلوب غير موجود',
      'error_validation_failed': 'بيانات الإدخال غير صالحة',
      'error_cache_failure': 'فشل الوصول إلى الذاكرة المحلية المخزنة',
      'error_unknown': 'حدث خطأ غير متوقع',
      'auth_session_expired': 'انتهت صلاحية الجلسة المحلية، يرجى الاتصال بالإنترنت وتسجيل الدخول مجدداً',
    },
    'en': {
      // General & Actions
      'app_name': 'Al-Fateh ISP Management',
      'app_subtitle': 'Integrated Internet Services Management System',
      'welcome_admin': 'Welcome to Al-Fateh Control Center',
      'status_connected': 'Server Connected',
      'status_connected_short': 'Connected',
      'theme_system': 'System Theme (Auto)',
      'theme_dark': 'Dark Mode',
      'theme_light': 'Light Mode',
      'lang_system': 'Device Language (Auto)',
      'lang_ar': 'Arabic',
      'lang_en': 'English',
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
      'logout': 'Sign Out',
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
      'val_username_empty': 'Please enter username',
      'val_password_empty': 'Please enter password',
      'val_password_short': 'Password too short (min 4 characters)',

      // Authentication & Login
      'login_title': 'System Authentication',
      'login_subtitle': 'Enter your credentials to access the management portal',
      'username': 'Username',
      'username_hint': 'e.g. admin or hashem',
      'password': 'Password',
      'password_hint': '••••••••',
      'remember_me': 'Remember me on this device',
      'remember_me_tooltip': 'Save session for quick offline access and auto-fill',
      'sign_in': 'Sign In',
      'signing_in': 'Authenticating credentials...',
      'login_success': 'Successfully authenticated',
      'offline_mode_banner': 'Logged in offline mode (cached local session)',
      'forgot_password': 'Forgot password?',
      'forgot_password_desc': 'Please contact Al-Fateh Administration to reset credentials',
      'show_password': 'Show password',
      'hide_password': 'Hide password',
      'need_help': 'Need assistance?',
      'contact_admin': 'Contact System Administration',
      'security_badge': 'Secure 256-bit Encrypted Connection',
      'preview_skeleton': 'Preview Skeleton Loading',
      'login_brand_desc': 'Unified control portal for ISP operations, subscriber follow-ups, and intelligent attendance.',
      'feature_tickets_title': 'Real-time Support Tickets Management',
      'feature_tickets_desc': 'Direct synchronization with Google Sheets & subscriber statuses',
      'feature_geofence_title': 'Smart Attendance with Geofencing',
      'feature_geofence_desc': 'Accurate check-in/out within HQ premises and branch locations',
      'feature_rbac_title': 'Advanced Security & RBAC Permissions',
      'feature_rbac_desc': 'Fine-grained role permissions with immutable audit trail logs',
      'whatsapp_contact': 'Contact Support on WhatsApp',
      'whatsapp_launch_error': 'Could not launch WhatsApp, please try again later',
      'login_error_empty_fields': 'Please enter username and password',
      'login_error_invalid_password': 'Incorrect password',
      'login_error_user_not_found': 'Username not found',
      'login_error_account_disabled': 'This account has been disabled, please contact Al-Fateh admin',
      'login_error_network': 'Unable to connect to server, please check your network connection',
      'login_error_generic': 'Login failed, please check your credentials and try again',

      // Navigation & Sections
      'nav_home': 'Home',
      'nav_tickets': 'Technical Tickets',
      'nav_attendance': 'Attendance',
      'nav_employees': 'Staff & Roles',
      'nav_settings': 'Settings & Account',

      // Confirm Dialog
      'confirm_logout_title': 'Confirm Sign Out',
      'confirm_logout_msg': 'Are you sure you want to sign out of Al-Fateh System?',
      'confirm_logout_button': 'Sign Out',

      // Dashboard & Statistics
      'stat_total_tickets': 'Total Tickets',
      'stat_in_progress': 'In Progress',
      'stat_resolved_today': 'Resolved Today',
      'stat_attendance_status': 'Attendance Today',
      'stat_present': 'Present at Work',
      'stat_not_checked_in': 'Not Checked In',
      'stat_active_users': 'Active Staff',
      'stat_quick_actions': 'Quick Actions',
      'stat_recent_tickets': 'Recent Support Tickets',
      'stat_view_all': 'View All',
      'stat_refresh_data': 'Refresh Data',
      'stat_offline_indicator': 'Offline Local Cache Mode',
      'action_new_ticket': 'New Ticket',
      'action_check_in': 'Clock In / Out',
      'action_manage_users': 'Manage Users',
      'action_payroll_audit': 'Payroll Audit',
      'action_settings': 'Account Settings',

      // Modules Placeholders
      'tickets_view_title': 'Technical Support & Tickets Management',
      'tickets_view_desc': 'Manage subscriber calls, log hardware issues, and real-time Google Sheets tracking',
      'attendance_view_title': 'Smart GPS Attendance & Geofenced Clock',
      'attendance_view_desc': 'Check-in with GPS verification within company geofence radius and shifts management',
      'employees_view_title': 'Staff, Accounts & RBAC Permissions',
      'employees_view_desc': 'Manage staff roster, access permissions matrix, and immutable audit logs',
      'settings_view_title': 'Application & Profile Settings',
      'settings_view_desc': 'Manage theme preferences, language, security, and active session details',

      // User Roles
      'role_admin': 'System Administrator',
      'role_gm': 'General Manager',
      'role_finance': 'Finance & Accounting',
      'role_support_manager': 'Support Manager',
      'role_sales_manager': 'Sales Manager',
      'role_support': 'Technical Support',
      'role_sales': 'Sales Representative',

      // Errors
      'error_network_connection': 'No internet connection, please check network',
      'error_network_timeout': 'Server request timed out, please retry',
      'error_server_internal': 'Unexpected internal server error',
      'error_unauthorized': 'Unauthorized session, please log in again',
      'error_forbidden': 'You do not have permission to perform this action',
      'error_not_found': 'The requested record was not found',
      'error_validation_failed': 'Form input validation failed',
      'error_cache_failure': 'Failed to access local encrypted storage',
      'error_unknown': 'An unexpected error occurred',
      'auth_session_expired': 'Local session expired, please connect to internet and log in again',
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
  String trServer(dynamic messageOrError) =>
      BackendMessageTranslator.translate(this, messageOrError);
}
