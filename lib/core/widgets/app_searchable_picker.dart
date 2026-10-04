import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';
import 'app_button.dart';
import 'app_card.dart';

/// منتقي قابل للبحث مرن وموديرن مع دعم إضافة عنصر جديد تلقائياً
class AppSearchablePicker extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String label;
  final String hint;
  final IconData prefixIcon;
  final ValueChanged<String> onChanged;
  final Future<bool> Function(String newItem)? onAddNewItem;
  final String? addNewItemLabel;

  const AppSearchablePicker({
    super.key,
    required this.value,
    required this.items,
    required this.label,
    this.hint = '',
    this.prefixIcon = Icons.list_rounded,
    required this.onChanged,
    this.onAddNewItem,
    this.addNewItemLabel,
  });

  void _openSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => _SearchDialog(
        initialItems: items,
        selectedValue: value,
        title: label,
        hint: hint.isNotEmpty ? hint : context.tr('search_problem_hint'),
        onSelected: (val) {
          onChanged(val);
          Navigator.of(ctx).pop();
        },
        onAddNewItem: onAddNewItem,
        addNewItemLabel: addNewItemLabel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final displayVal = (value != null && value!.isNotEmpty)
        ? value!
        : (hint.isNotEmpty ? hint : label);

    return InkWell(
      onTap: () => _openSearchDialog(context),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colors.outlineVariant.withValues(alpha: 0.35),
          ),
        ),
        child: Row(
          children: [
            Icon(prefixIcon, size: 20, color: colors.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                displayVal,
                style: TextStyle(
                  fontFamily: AppAssets.fontPrimary,
                  fontSize: 13,
                  fontWeight: (value != null && value!.isNotEmpty)
                      ? FontWeight.w600
                      : FontWeight.normal,
                  color: (value != null && value!.isNotEmpty)
                      ? colors.onSurface
                      : colors.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.search_rounded,
              size: 18,
              color: colors.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: colors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchDialog extends StatefulWidget {
  final List<String> initialItems;
  final String? selectedValue;
  final String title;
  final String hint;
  final ValueChanged<String> onSelected;
  final Future<bool> Function(String newItem)? onAddNewItem;
  final String? addNewItemLabel;

  const _SearchDialog({
    required this.initialItems,
    required this.selectedValue,
    required this.title,
    required this.hint,
    required this.onSelected,
    this.onAddNewItem,
    this.addNewItemLabel,
  });

  @override
  State<_SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<_SearchDialog> {
  final _searchController = TextEditingController();
  late List<String> _items;
  List<String> _filteredItems = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _items = widget.initialItems
        .where((e) => e.trim().isNotEmpty)
        .toSet()
        .toList();
    _filteredItems = List.from(_items);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filter(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        _filteredItems = List.from(_items);
      } else {
        _filteredItems =
            _items.where((i) => i.toLowerCase().contains(q)).toList();
      }
    });
  }

  Future<void> _handleAddNew() async {
    final query = _searchController.text.trim();
    if (query.isEmpty || widget.onAddNewItem == null) return;

    setState(() => _isLoading = true);
    final success = await widget.onAddNewItem!(query);
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (success) {
      if (!_items.contains(query)) {
        _items.insert(0, query);
      }
      widget.onSelected(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final query = _searchController.text.trim();
    final hasExactMatch =
        _items.any((i) => i.trim().toLowerCase() == query.toLowerCase());

    return Dialog(
      backgroundColor: colors.surface,
      surfaceTintColor: colors.surfaceTint,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 580),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // رأس النافذة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: AppAssets.fontSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: colors.onSurface,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    visualDensity: VisualDensity.compact,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // حقل البحث
              TextFormField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  prefixIcon: const Icon(Icons.search_rounded),
                  isDense: true,
                  filled: true,
                  fillColor:
                      colors.surfaceContainerHighest.withValues(alpha: 0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colors.outlineVariant),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: colors.outlineVariant.withValues(alpha: 0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colors.primary, width: 1.5),
                  ),
                ),
                onChanged: _filter,
              ),
              const SizedBox(height: 12),

              // زر إضافة كعنصر جديد إذا لم يكن موجوداً
              if (query.isNotEmpty &&
                  !hasExactMatch &&
                  widget.onAddNewItem != null) ...[
                AppCard(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  backgroundColor:
                      colors.primaryContainer.withValues(alpha: 0.35),
                  child: Row(
                    children: [
                      Icon(Icons.add_circle_outline_rounded,
                          size: 18, color: colors.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${widget.addNewItemLabel ?? context.tr('add_new_problem_type')}: "$query"',
                          style: TextStyle(
                            fontFamily: AppAssets.fontPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: colors.primary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      AppButton(
                        label: context.tr('save'),
                        isLoading: _isLoading,
                        onPressed: _handleAddNew,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],

              // قائمة النتائج
              Expanded(
                child: _filteredItems.isEmpty
                    ? Center(
                        child: Text(
                          context.tr('no_tickets_found_title'),
                          style: TextStyle(
                            fontFamily: AppAssets.fontPrimary,
                            fontSize: 13,
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = _filteredItems[index];
                          final isSelected = item == widget.selectedValue;

                          return ListTile(
                            dense: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            tileColor: isSelected
                                ? colors.primaryContainer.withValues(alpha: 0.3)
                                : null,
                            leading: Icon(
                              isSelected
                                  ? Icons.check_circle_rounded
                                  : Icons.circle_outlined,
                              size: 18,
                              color: isSelected
                                  ? colors.primary
                                  : colors.onSurfaceVariant,
                            ),
                            title: Text(
                              item,
                              style: TextStyle(
                                fontFamily: AppAssets.fontPrimary,
                                fontSize: 13,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected
                                    ? colors.primary
                                    : colors.onSurface,
                              ),
                            ),
                            onTap: () => widget.onSelected(item),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
