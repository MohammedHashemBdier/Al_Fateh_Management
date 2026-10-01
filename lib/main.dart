import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AlFatehApp());
}

class AlFatehApp extends StatefulWidget {
  const AlFatehApp({super.key});

  @override
  State<AlFatehApp> createState() => _AlFatehAppState();
}

class _AlFatehAppState extends State<AlFatehApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شركة الفتح - إدارة الدعم الفني',
      debugShowCheckedModeBanner: false,
      
      // التوطين ودعم اللغة العربية من اليمين لليسار (RTL)
      locale: const Locale('ar', 'SY'),
      supportedLocales: const [
        Locale('ar', 'SY'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // الثيم المخصص من ملف theme.dart
      theme: MaterialTheme.lightTheme,
      darkTheme: MaterialTheme.darkTheme,
      themeMode: _themeMode,

      home: HomeScreen(
        onToggleTheme: _toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.router_rounded,
                color: colorScheme.onPrimaryContainer,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'شركة الفتح لخدمات الإنترنت',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontFamily: 'Alhadari',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'نظام متابعة الدعم الفني وتسجيل المكالمات',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: isDarkMode ? 'الوضع النهاري' : 'الوضع الليلي',
            icon: Icon(
              isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            ),
            onPressed: onToggleTheme,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة الترحيب والجاهزية
            Card(
              elevation: 0,
              color: colorScheme.surfaceContainerHighest,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: colorScheme.outlineVariant),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: colorScheme.primary,
                      child: Icon(
                        Icons.check_circle_outline_rounded,
                        color: colorScheme.onPrimary,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تم تجهيز الثيم والخطوط بنجاح!',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontFamily: 'Alhadari',
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'الخط الأساسي للنصوص: Monadi • الخط الثانوي للعناوين: Alhadari-Bold • مع دعم كامل للغة العربية (RTL)',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // عنوان قسم الإحصائيات (بالخط الثانوي العريض Alhadari)
            Text(
              'مؤشرات المتابعة اليومية',
              style: theme.textTheme.titleLarge?.copyWith(
                fontFamily: 'Alhadari',
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 14),

            // بطاقات إحصائيات سريعة
            LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = constraints.maxWidth > 800
                    ? (constraints.maxWidth - (3 * 14)) / 4
                    : (constraints.maxWidth > 450
                        ? (constraints.maxWidth - 14) / 2
                        : constraints.maxWidth);
                return Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    SizedBox(
                      width: itemWidth,
                      child: _buildStatCard(
                        context: context,
                        title: 'إجمالي المكالمات',
                        count: '0',
                        icon: Icons.headset_mic_rounded,
                        color: colorScheme.primary,
                        bgColor: colorScheme.primaryContainer,
                      ),
                    ),
                    SizedBox(
                      width: itemWidth,
                      child: _buildStatCard(
                        context: context,
                        title: 'تم الحل',
                        count: '0',
                        icon: Icons.task_alt_rounded,
                        color: const Color(0xff2e7d32),
                        bgColor: const Color(0xffe8f5e9),
                      ),
                    ),
                    SizedBox(
                      width: itemWidth,
                      child: _buildStatCard(
                        context: context,
                        title: 'قيد الحل',
                        count: '0',
                        icon: Icons.pending_actions_rounded,
                        color: const Color(0xffe65100),
                        bgColor: const Color(0xfffff3e0),
                      ),
                    ),
                    SizedBox(
                      width: itemWidth,
                      child: _buildStatCard(
                        context: context,
                        title: 'لم يتم الحل',
                        count: '0',
                        icon: Icons.error_outline_rounded,
                        color: colorScheme.error,
                        bgColor: colorScheme.errorContainer,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),

            // قسم استعراض الخطوط والعناصر
            Text(
              'استعراض الخطوط والمظهر (Typography & Components)',
              style: theme.textTheme.titleLarge?.copyWith(
                fontFamily: 'Alhadari',
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 14),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: colorScheme.outlineVariant),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'خط العناوين (Alhadari-Bold):',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Alhadari',
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'أهلاً بكم في شركة الفتح لخدمات الإنترنت - قسم الدعم الفني والصيانة',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontFamily: 'Alhadari',
                        color: colorScheme.primary,
                      ),
                    ),
                    const Divider(height: 28),
                    Text(
                      'خط النصوص والأزرار (Monadi):',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Alhadari',
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'هذا النص يظهر بالخط الأساسي (Monadi)، وهو مريح جداً للقراءة وسهل المتابعة في جداول التذاكر، وأرقام الهواتف الأرضية، وأسماء المشتركين، وتفاصيل المشاكل وطرق الحل.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add_call),
                          label: const Text('تسجيل مكالمة جديدة'),
                        ),
                        FilledButton.tonalIcon(
                          onPressed: () {},
                          icon: const Icon(Icons.refresh_rounded),
                          label: const Text('تحديث من Google Sheet'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.search_rounded),
                          label: const Text('بحث برقم الهاتف الأرضي'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required String title,
    required String count,
    required IconData icon,
    required Color color,
    required Color bgColor,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.15),
            radius: 20,
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontFamily: 'Alhadari',
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
