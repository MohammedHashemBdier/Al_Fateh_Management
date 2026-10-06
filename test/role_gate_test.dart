import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/core/rbac/role_permissions.dart';
import 'package:al_fateh_management/core/widgets/role_gate.dart';

void main() {
  group('RoleGate & PermissionGate Widget Tests', () {
    testWidgets('RoleGate shows child when user role matches', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RoleGate(
              userRole: UserRole.admin,
              allowedRoles: [UserRole.admin],
              child: Text('Admin Content'),
            ),
          ),
        ),
      );

      expect(find.text('Admin Content'), findsOneWidget);
    });

    testWidgets(
      'RoleGate hides child and shows fallback when role does not match',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: RoleGate(
                userRole: UserRole.support,
                allowedRoles: [UserRole.finance],
                fallback: Text('Access Denied'),
                child: Text('Secret Content'),
              ),
            ),
          ),
        );

        expect(find.text('Secret Content'), findsNothing);
        expect(find.text('Access Denied'), findsOneWidget);
      },
    );

    testWidgets('PermissionGate allows action when user has permission', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PermissionGate(
              userRole: UserRole.admin,
              permissionCode: AppPermissions.usersManage,
              child: Text('Manage Users Button'),
            ),
          ),
        ),
      );

      expect(find.text('Manage Users Button'), findsOneWidget);
    });

    testWidgets('ScopeGate correctly checks minimum scope hierarchy', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ScopeGate(
              userRole: UserRole.admin,
              minimumScope: PermissionScope.department,
              child: Text('Department Overview'),
            ),
          ),
        ),
      );

      expect(find.text('Department Overview'), findsOneWidget);
    });
  });
}
