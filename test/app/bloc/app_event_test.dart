// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:daily_globe/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class MockUser extends Mock implements User {}

void main() {
  group('AppEvent', () {
    group('AppUserChanged', () {
      final user = MockUser();

      test('supports value comparisons', () {
        expect(
          AppUserChanged(user),
          AppUserChanged(user),
        );
      });
    });

    group('AppOnboardingCompleted', () {
      test('supports value comparisons', () {
        expect(
          AppOnboardingCompleted(),
          AppOnboardingCompleted(),
        );
      });
    });

    group('AppLogoutRequested', () {
      test('supports value comparisons', () {
        expect(
          AppLogoutRequested(),
          AppLogoutRequested(),
        );
      });
    });

    group('AppDeleteAccountRequested', () {
      test('supports value comparisons', () {
        expect(
          AppDeleteAccountRequested(),
          AppDeleteAccountRequested(),
        );
      });
    });

    group('AppOpened', () {
      test('supports value comparisons', () {
        expect(
          AppOpened(),
          AppOpened(),
        );
      });
    });
  });
}
