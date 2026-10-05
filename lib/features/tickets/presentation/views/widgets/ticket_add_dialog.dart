import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/services/services.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/utils/input_validators.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/models/ticket_model.dart';

/// نافذة إضافة تذكرة دعم فني جديدة أو متابعة شكوى
class TicketAddDialog extends StatefulWidget {
  final List<String> problems;
  final List<String> employees;
  final String currentUser;
  final Future<bool> Function(TicketModel ticket) onSave;
  final Future<bool> Function(String newProblem) onAddNewProblem;

  const TicketAddDialog({
    super.key,
    required this.problems,
    required this.employees,
    required this.currentUser,
    required this.onSave,
    required this.onAddNewProblem,
  });

  static Future<bool?> show(
    BuildContext context, {
    required List<String> problems,
    required List<String> employees,
    required String currentUser,
    required Future<bool> Function(TicketModel ticket) onSave,
    required Future<bool> Function(String newProblem) onAddNewProblem,
  }) {
    return AppDialogService.custom<bool>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => TicketAddDialog(
        problems: problems,
        employees: employees,
        currentUser: currentUser,
        onSave: onSave,
        onAddNewProblem: onAddNewProblem,
      ),
    );
  }

  @override
  State<TicketAddDialog> createState() => _TicketAddDialogState();
}

class _TicketAddDialogState extends State<TicketAddDialog> {
  final _formKey = GlobalKey<FormState>();

  final _subscriberController = TextEditingController();
  final _landlineController = TextEditingController();
  final _mobileController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _solutionController = TextEditingController();
  final _newProblemController = TextEditingController();

  late List<String> _problems;
  late List<String> _employees;
  String? _selectedProblem;
  String? _selectedEmployee;
  String _selectedStatus = 'قيد الحل';
  bool _isLoading = false;
  bool _isAddingCustomProblem = false;

  @override
  void initState() {
    super.initState();
    _problems = widget.problems
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toSet()
        .toList();
    _employees = widget.employees
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toSet()
        .toList();

    if (_problems.isNotEmpty) {
      _selectedProblem = _problems.first;
    }
    if (_employees.isNotEmpty) {
      _selectedEmployee = _employees.contains(widget.currentUser)
          ? widget.currentUser
          : _employees.first;
    }
  }

  @override
  void dispose() {
    _subscriberController.dispose();
    _landlineController.dispose();
    _mobileController.dispose();
    _descriptionController.dispose();
    _solutionController.dispose();
    _newProblemController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedProblem == null || _selectedProblem!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: AppText.body(context.tr('select_problem_required'))),
      );
      return;
    }

    setState(() => _isLoading = true);

    final now = DateTime.now();
    final dateStr =
        '${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}';
    final timeStr =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    final newTicket = TicketModel(
      rowId: 0,
      date: dateStr,
      time: timeStr,
      subscriberName: _subscriberController.text.trim(),
      landline: _landlineController.text.trim(),
      mobile: _mobileController.text.trim(),
      problem: _selectedProblem!,
      solution: _solutionController.text.trim(),
      status: _selectedStatus,
      description: _descriptionController.text.trim(),
      employee: _selectedEmployee ?? widget.currentUser,
      createdBy: widget.currentUser,
      updatedAt: now,
    );

    final success = await widget.onSave(newTicket);
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (success) {
      Navigator.of(context).pop(true);
    }
  }

  Future<void> _handleAddNewProblem() async {
    final name = _newProblemController.text.trim();
    if (name.isEmpty) return;

    setState(() => _isLoading = true);
    final success = await widget.onAddNewProblem(name);
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      if (success) {
        _isAddingCustomProblem = false;
        if (!_problems.contains(name)) {
          _problems.insert(0, name);
        }
        _selectedProblem = name;
        _newProblemController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Dialog(
      backgroundColor: colors.surface,
      surfaceTintColor: colors.surfaceTint,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: AppFadeSlide(
        scaleIn: true,
        initialScale: 0.94,
        duration: const Duration(milliseconds: 260),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620, maxHeight: 720),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // رأس النافذة
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: colors.primaryContainer,
                        child: Icon(
                          Icons.add_task_rounded,
                          color: colors.onPrimaryContainer,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.titleLarge(
                              'dialog_add_ticket_title',
                              fontWeight: FontWeight.bold,
                              fontFamily: AppAssets.fontSecondary,
                              fontSize: 18,
                              color: colors.onSurface,
                            ),
                            AppText.caption(
                              'dialog_add_ticket_desc',
                              fontSize: 12,
                              color: colors.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: _isLoading
                            ? null
                            : () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Divider(color: colors.outlineVariant.withValues(alpha: 0.3)),
                  const SizedBox(height: 12),

                  // حقول الإدخال قابلة للسكرول
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // اسم المشترك
                          AppTextField(
                            controller: _subscriberController,
                            label: context.tr('subscriber_name_label'),
                            hint: context.tr('subscriber_name_hint'),
                            prefixIcon: Icons.person_rounded,
                            validator: (v) => InputValidators.requiredField(
                              v,
                              customMessage: context.tr(
                                'val_subscriber_required',
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),

                          // الهاتف الأرضي والموبايل (10 أرقام)
                          Row(
                            children: [
                              Expanded(
                                child: AppTextField(
                                  controller: _landlineController,
                                  label: context.tr('landline_label'),
                                  hint: '0112345678',
                                  prefixIcon: Icons.phone_in_talk_rounded,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  validator: (v) =>
                                      InputValidators.validateLandline(
                                        v,
                                        context: context,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppTextField(
                                  controller: _mobileController,
                                  label: context.tr('mobile_label'),
                                  hint: '0999123456',
                                  prefixIcon: Icons.phone_android_rounded,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  validator: (v) =>
                                      InputValidators.validateMobile(
                                        v,
                                        context: context,
                                        isRequired: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // نوع المشكلة مع منتقي قابل للبحث وإضافة مشكلة جديدة
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText.label(
                                    'problem_type_label',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: colors.onSurface,
                                  ),
                                  AppButton(
                                    label: _isAddingCustomProblem
                                        ? context.tr('cancel')
                                        : context.tr('add_new_problem_type'),
                                    icon: _isAddingCustomProblem
                                        ? Icons.close_rounded
                                        : Icons.add_circle_outline_rounded,
                                    variant: AppButtonVariant.text,
                                    height: 32,
                                    onPressed: () {
                                      setState(() {
                                        _isAddingCustomProblem =
                                            !_isAddingCustomProblem;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              if (_isAddingCustomProblem) ...[
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppTextField(
                                        controller: _newProblemController,
                                        label: context.tr('problem_type_label'),
                                        hint: context.tr(
                                          'new_problem_name_hint',
                                        ),
                                        prefixIcon: Icons.build_circle_outlined,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    AppButton(
                                      label: context.tr('save'),
                                      isLoading: _isLoading,
                                      onPressed: _handleAddNewProblem,
                                    ),
                                  ],
                                ),
                              ] else ...[
                                AppSearchablePicker(
                                  value: _selectedProblem,
                                  items: _problems,
                                  label: context.tr('problem_type_label'),
                                  hint: context.tr('search_problem_hint'),
                                  prefixIcon: Icons.build_circle_outlined,
                                  onChanged: (val) {
                                    setState(() => _selectedProblem = val);
                                  },
                                  onAddNewItem: (name) async {
                                    final ok = await widget.onAddNewProblem(
                                      name,
                                    );
                                    if (ok) {
                                      setState(() {
                                        if (!_problems.contains(name)) {
                                          _problems.insert(0, name);
                                        }
                                        _selectedProblem = name;
                                      });
                                    }
                                    return ok;
                                  },
                                  addNewItemLabel: context.tr(
                                    'add_new_problem_type',
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 14),

                          // الموظف المسند إليه
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.label(
                                'assigned_to_label',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: colors.onSurface,
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.surfaceContainerLow,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: colors.outlineVariant.withValues(
                                      alpha: 0.35,
                                    ),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value:
                                        _employees.contains(_selectedEmployee)
                                        ? _selectedEmployee
                                        : (_employees.isNotEmpty
                                              ? _employees.first
                                              : null),
                                    isExpanded: true,
                                    items: _employees.map((emp) {
                                      return DropdownMenuItem<String>(
                                        value: emp,
                                        child: AppText.literal(
                                          emp,
                                          fontSize: 13,
                                          color: colors.onSurface,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      if (val != null) {
                                        setState(() => _selectedEmployee = val);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // حالة التذكرة المبدئية (قيد الحل أو تم الحل مباشرة)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.label(
                                'col_status',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: colors.onSurface,
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.surfaceContainerLow,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: colors.outlineVariant.withValues(
                                      alpha: 0.35,
                                    ),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedStatus,
                                    isExpanded: true,
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: 'قيد الحل',
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.hourglass_top_rounded,
                                              size: 16,
                                              color: colors.primary,
                                            ),
                                            const SizedBox(width: 8),
                                            AppText.literal(
                                              'قيد الحل (مفتوحة للمتابعة)',
                                              fontSize: 13,
                                              color: colors.onSurface,
                                            ),
                                          ],
                                        ),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'تم الحل',
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons
                                                  .check_circle_outline_rounded,
                                              size: 16,
                                              color: colors.tertiary,
                                            ),
                                            const SizedBox(width: 8),
                                            AppText.literal(
                                              'تم الحل (إغلاق فوري للتذكرة)',
                                              fontSize: 13,
                                              color: colors.onSurface,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                    onChanged: (val) {
                                      if (val != null) {
                                        setState(() => _selectedStatus = val);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // في حال اختيار تم الحل يظهر حقل طريقة الحل
                          if (_selectedStatus == 'تم الحل') ...[
                            AppTextField(
                              controller: _solutionController,
                              label: context.tr('col_solution'),
                              hint: 'اكتب طريقة الحل والإجراء المتخذ...',
                              prefixIcon: Icons.task_alt_rounded,
                              maxLines: 2,
                              validator: (v) => InputValidators.requiredField(
                                v,
                                customMessage:
                                    'يرجى كتابة طريقة الحل عند إغلاق التذكرة',
                              ),
                            ),
                            const SizedBox(height: 14),
                          ],

                          // التوصيف والملاحظات
                          AppTextField(
                            controller: _descriptionController,
                            label: context.tr('description_label'),
                            hint: context.tr('description_hint'),
                            prefixIcon: Icons.description_outlined,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Divider(color: colors.outlineVariant.withValues(alpha: 0.3)),
                  const SizedBox(height: 12),

                  // أزرار التحكم السفلية
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        label: context.tr('cancel'),
                        variant: AppButtonVariant.ghost,
                        customColor: colors.onSurfaceVariant,
                        onPressed: _isLoading
                            ? null
                            : () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: 12),
                      AppButton(
                        label: context.tr('save_ticket_btn'),
                        icon: Icons.check_circle_outline_rounded,
                        isLoading: _isLoading,
                        onPressed: _handleSave,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
