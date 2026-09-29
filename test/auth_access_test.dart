import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_routes.dart';
import 'package:waraqah/app/router/route_access.dart';
import 'package:waraqah/features/auth/domain/entities/app_user.dart';
import 'package:waraqah/features/auth/domain/entities/auth_failure.dart';
import 'package:waraqah/features/auth/domain/entities/user_role.dart';
import 'package:waraqah/features/auth/domain/repositories/auth_repository.dart';
import 'package:waraqah/features/auth/domain/usecases/sign_in.dart';

AppUser _user(UserRole role) =>
    AppUser(id: 'u1', name: 'Test', email: 't@waraqah.test', role: role);

class _NeverCalledRepository implements AuthRepository {
  @override
  AppUser? savedUser() => null;

  @override
  Future<AppUser> signIn({required String email, required String password}) =>
      throw StateError('should not reach the repository');

  @override
  Future<void> signOut() async {}
}

void main() {
  group('UserRole', () {
    test('only readers are not staff', () {
      expect(UserRole.reader.isStaff, isFalse);
      for (final role in UserRole.values.where((r) => r != UserRole.reader)) {
        expect(role.isStaff, isTrue, reason: role.name);
      }
    });

    test('each staff role gets its own area; super admin gets all', () {
      expect(UserRole.moderator.canModerate, isTrue);
      expect(UserRole.moderator.canManageCatalog, isFalse);
      expect(UserRole.catalogManager.canManageCatalog, isTrue);
      expect(UserRole.support.canManageOrders, isTrue);
      expect(UserRole.superAdmin.canModerate, isTrue);
      expect(UserRole.superAdmin.canManageCatalog, isTrue);
      expect(UserRole.superAdmin.canManageOrders, isTrue);
    });
  });

  group('RouteAccess', () {
    const admin = AppRoutes.admin;

    test('guests are sent to login from the admin area', () {
      expect(RouteAccess.redirect(admin, null), AppRoutes.login);
      expect(RouteAccess.redirect('$admin/books', null), AppRoutes.login);
    });

    test('readers are sent home from the admin area', () {
      expect(
        RouteAccess.redirect(admin, _user(UserRole.reader)),
        AppRoutes.home,
      );
    });

    test('staff can open the admin area', () {
      expect(RouteAccess.redirect(admin, _user(UserRole.moderator)), isNull);
      expect(
        RouteAccess.redirect('$admin/x', _user(UserRole.superAdmin)),
        isNull,
      );
    });

    test('signed-in users skip the login page; guests can browse', () {
      expect(
        RouteAccess.redirect(AppRoutes.login, _user(UserRole.reader)),
        AppRoutes.home,
      );
      expect(RouteAccess.redirect(AppRoutes.login, null), isNull);
      expect(RouteAccess.redirect(AppRoutes.catalog, null), isNull);
    });

    test('a path that only starts with /admin is not the admin area', () {
      expect(RouteAccess.redirect('/administrator', null), isNull);
    });
  });

  group('SignIn', () {
    final signIn = SignIn(_NeverCalledRepository());

    test('rejects a bad email before calling the server', () {
      expect(
        signIn(const SignInParams(email: 'not-an-email', password: 'x')),
        throwsA(AuthFailure.invalidEmail),
      );
    });

    test('rejects an empty password before calling the server', () {
      expect(
        signIn(const SignInParams(email: 'a@waraqah.test', password: '')),
        throwsA(AuthFailure.missingPassword),
      );
    });
  });
}
