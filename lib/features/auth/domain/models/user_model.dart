/// نموذج المستخدم والأدوار في منظومة الفتح
class UserModel {
  final String userId;
  final String username;
  final String fullName;
  final String department;
  final String roleId;
  final String status;
  final String? createdAt;

  const UserModel({
    required this.userId,
    required this.username,
    required this.fullName,
    required this.department,
    required this.roleId,
    required this.status,
    this.createdAt,
  });

  bool get isActive =>
      status.toUpperCase() == 'ACTIVE' || status == 'نشط' || status == 'TRUE';

  // مساعدات فحص الأدوار الإدارية والتشغيلية
  bool get isAdmin => roleId == 'ROLE_ADMIN';
  bool get isGM => roleId == 'ROLE_GM';
  bool get isFinance => roleId == 'ROLE_FINANCE';
  bool get isSupport => roleId == 'ROLE_SUPPORT';
  bool get isSales => roleId == 'ROLE_SALES';

  // هل يملك صلاحيات إدارية عامة
  bool get canAccessManagement => isAdmin || isGM;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
      fullName: json['full_name']?.toString() ?? '',
      department: json['department']?.toString() ?? '',
      roleId: json['role_id']?.toString() ?? 'ROLE_SUPPORT',
      status: json['status']?.toString() ?? 'ACTIVE',
      createdAt: json['created_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'full_name': fullName,
      'department': department,
      'role_id': roleId,
      'status': status,
      'created_at': createdAt,
    };
  }
}
