import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';

/// شريط ترقيم وتصفح صفحات عام وقابل لإعادة الاستخدام (Reusable Pagination Bar)
class AppPaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int totalCount;
  final int pageSize;
  final List<int> pageSizeOptions;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int>? onPageSizeChanged;

  const AppPaginationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.totalCount,
    this.pageSize = 20,
    this.pageSizeOptions = const [10, 20, 50, 100],
    required this.onPageChanged,
    this.onPageSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompact = context.isMobile;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // عداد الصفحات وعدد العناصر بالصفحة
          Flexible(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: [
                Text(
                  '${context.tr('page')} $currentPage / $totalPages',
                  style: TextStyle(
                    fontFamily: AppAssets.fontPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: colors.onSurfaceVariant,
                  ),
                ),
                if (onPageSizeChanged != null) ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isCompact) ...[
                        Text(
                          context.tr('rows_per_page'),
                          style: TextStyle(
                            fontFamily: AppAssets.fontPrimary,
                            fontSize: 11,
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: colors.surfaceContainerHighest
                              .withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: colors.outlineVariant
                                .withValues(alpha: 0.4),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: pageSizeOptions.contains(pageSize)
                                ? pageSize
                                : pageSizeOptions.first,
                            isDense: true,
                            borderRadius: BorderRadius.circular(8),
                            dropdownColor: colors.surfaceContainerHigh,
                            items: pageSizeOptions.map((size) {
                              return DropdownMenuItem<int>(
                                value: size,
                                child: Text(
                                  '$size ${context.isArabic ? 'سطر' : 'rows'}',
                                  style: TextStyle(
                                    fontFamily: AppAssets.fontPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: colors.onSurface,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newSize) {
                              if (newSize != null) {
                                onPageSizeChanged!(newSize);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // أزرار التنقل (السابق / العداد / التالي)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded),
                tooltip: context.isArabic ? 'السابق' : 'Previous',
                onPressed: currentPage > 1
                    ? () => onPageChanged(currentPage - 1)
                    : null,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: colors.primaryContainer.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$currentPage',
                  style: TextStyle(
                    fontFamily: AppAssets.fontPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: colors.primary,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded),
                tooltip: context.isArabic ? 'التالي' : 'Next',
                onPressed: currentPage < totalPages
                    ? () => onPageChanged(currentPage + 1)
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
