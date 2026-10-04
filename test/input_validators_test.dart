import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/core/utils/input_validators.dart';

void main() {
  group('InputValidators Tests', () {
    test('validateLandline requires non-empty value', () {
      expect(InputValidators.validateLandline(null), isNotNull);
      expect(InputValidators.validateLandline(''), isNotNull);
      expect(InputValidators.validateLandline('   '), isNotNull);
    });

    test('validateLandline requires digits only', () {
      expect(InputValidators.validateLandline('011abcdefg'), contains('أرقام فقط'));
      expect(InputValidators.validateLandline('011-226292'), contains('أرقام فقط'));
    });

    test('validateLandline enforces exactly 10 digits', () {
      // Less than 10 digits
      expect(InputValidators.validateLandline('011226292'), contains('10 أرقام'));
      expect(InputValidators.validateLandline('12345'), contains('10 أرقام'));

      // More than 10 digits
      expect(InputValidators.validateLandline('011226292421'), contains('10 أرقام'));

      // Exactly 10 digits (Valid!)
      expect(InputValidators.validateLandline('0122629242'), isNull);
      expect(InputValidators.validateLandline('0112262924'), isNull);
      expect(InputValidators.validateLandline(' 0117731401 '), isNull);
    });

    test('validateMobile checks 10 digits when provided', () {
      // Optional when not required
      expect(InputValidators.validateMobile(null, isRequired: false), isNull);
      expect(InputValidators.validateMobile('', isRequired: false), isNull);

      // Required when specified
      expect(InputValidators.validateMobile('', isRequired: true), isNotNull);

      // Less than 10 digits
      expect(InputValidators.validateMobile('099912345'), isNotNull);

      // Non-digits
      expect(InputValidators.validateMobile('0999abc456'), isNotNull);

      // Exactly 10 digits
      expect(InputValidators.validateMobile('0999123456'), isNull);
      expect(InputValidators.validateMobile('0933112233'), isNull);
    });

    test('validateSubscriberName requires at least 3 characters', () {
      expect(InputValidators.validateSubscriberName(null), isNotNull);
      expect(InputValidators.validateSubscriberName(''), isNotNull);
      expect(InputValidators.validateSubscriberName('أح'), isNotNull);
      expect(InputValidators.validateSubscriberName('أحمد'), isNull);
    });
  });
}
