import 'package:azerbaijan_utils/azerbaijan_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Phone Number Validation', () {
    test('Valid phone numbers should pass', () {
      expect(AzerbaijanUtils.validatePhoneNumber('+994501234567'), true);
      expect(AzerbaijanUtils.validatePhoneNumber('994501234567'), true);
      expect(AzerbaijanUtils.validatePhoneNumber('0501234567'), true);
      expect(AzerbaijanUtils.validatePhoneNumber('+994 50 123 45 67'), true);
      expect(AzerbaijanUtils.validatePhoneNumber('050-123-45-67'), true);
    });

    test('All operators should be valid', () {
      expect(AzerbaijanUtils.validatePhoneNumber('+994501234567'), true); 
      expect(AzerbaijanUtils.validatePhoneNumber('+994511234567'), true); 
      expect(AzerbaijanUtils.validatePhoneNumber('+994551234567'), true); 
      expect(AzerbaijanUtils.validatePhoneNumber('+994701234567'), true); 
      expect(AzerbaijanUtils.validatePhoneNumber('+994771234567'), true); 
      expect(AzerbaijanUtils.validatePhoneNumber('+994991234567'), true); 
      expect(AzerbaijanUtils.validatePhoneNumber('+994101234567'), true); 
      expect(AzerbaijanUtils.validatePhoneNumber('+994601234567'), true); 
    });

    test('Invalid phone numbers should fail', () {
      expect(AzerbaijanUtils.validatePhoneNumber('+994401234567'), false); 
      expect(AzerbaijanUtils.validatePhoneNumber('123456789'), false);
      expect(AzerbaijanUtils.validatePhoneNumber(''), false);
      expect(AzerbaijanUtils.validatePhoneNumber('+99450123456'), false); 
    });

    test('Phone number formatting should work', () {
      expect(AzerbaijanUtils.formatPhoneNumber('+994501234567'), '+994501234567');
      expect(AzerbaijanUtils.formatPhoneNumber('994501234567'), '+994501234567');
      expect(AzerbaijanUtils.formatPhoneNumber('0501234567'), '+994501234567');
      expect(AzerbaijanUtils.formatPhoneNumber('invalid'), null);
    });

    test('Operator detection should work', () {
      expect(AzerbaijanUtils.getPhoneOperator('+994501234567'), 'Azercell');
      expect(AzerbaijanUtils.getPhoneOperator('+994511234567'), 'Azercell');
      expect(AzerbaijanUtils.getPhoneOperator('+994551234567'), 'Azercell');
      expect(AzerbaijanUtils.getPhoneOperator('+994701234567'), 'Bakcell');
      expect(AzerbaijanUtils.getPhoneOperator('+994771234567'), 'Bakcell');
      expect(AzerbaijanUtils.getPhoneOperator('+994991234567'), 'Nar Mobile');
      expect(AzerbaijanUtils.getPhoneOperator('+994101234567'), 'Nakhtel');
      expect(AzerbaijanUtils.getPhoneOperator('+994601234567'), 'Ulduz Mobile');
    });
  });

  group('FIN Code Validation', () {
    test('Valid FIN codes should pass', () {
      expect(AzerbaijanUtils.validateFIN('1AB2C3D'), true);
      expect(AzerbaijanUtils.validateFIN('AA1BC2D'), true);
      expect(AzerbaijanUtils.validateFIN('7XYZABC'), true);
      expect(AzerbaijanUtils.validateFIN('1a2b3c4'), true);
    });

    test('Invalid FIN codes should fail', () {
      expect(AzerbaijanUtils.validateFIN('ABCDEFG'), false); 
      expect(AzerbaijanUtils.validateFIN('1234567'), false); 
      expect(AzerbaijanUtils.validateFIN('1AB2C3'), false); 
      expect(AzerbaijanUtils.validateFIN('1AB2C3DE'), false); 
      expect(AzerbaijanUtils.validateFIN(''), false);
    });
  });

  group('Vehicle Plate Validation', () {
    test('Valid vehicle plates should pass', () {
      expect(AzerbaijanUtils.validateVehiclePlate('10-AA-123'), true);
      expect(AzerbaijanUtils.validateVehiclePlate('10AA123'), true);
      expect(AzerbaijanUtils.validateVehiclePlate('10 AA 123'), true);
      expect(AzerbaijanUtils.validateVehiclePlate('77-BB-999'), true);
      expect(AzerbaijanUtils.validateVehiclePlate('01-ZZ-001'), true);
    });

    test('Invalid vehicle plates should fail', () {
      expect(AzerbaijanUtils.validateVehiclePlate('AA-10-123'), false);
      expect(AzerbaijanUtils.validateVehiclePlate('100-AA-123'), false);
      expect(AzerbaijanUtils.validateVehiclePlate('10-A-123'), false); 
      expect(AzerbaijanUtils.validateVehiclePlate(''), false);
    });

    test('Vehicle plate formatting should work', () {
      expect(AzerbaijanUtils.formatVehiclePlate('10AA123'), '10-AA-123');
      expect(AzerbaijanUtils.formatVehiclePlate('10 AA 123'), '10-AA-123');
      expect(AzerbaijanUtils.formatVehiclePlate('invalid'), null);
    });

    test('Region extraction should work', () {
      expect(AzerbaijanUtils.getVehicleRegion('10-AA-123'), '10');
      expect(AzerbaijanUtils.getVehicleRegion('77BB999'), '77');
      expect(AzerbaijanUtils.getVehicleRegion('invalid'), null);
    });
  });

  group('Postal Code Validation', () {
    test('Valid postal codes should pass', () {
      expect(AzerbaijanUtils.validatePostalCode('AZ1000'), true);
      expect(AzerbaijanUtils.validatePostalCode('AZ1001'), true);
      expect(AzerbaijanUtils.validatePostalCode('AZ100000'), true);
      expect(AzerbaijanUtils.validatePostalCode('AZ 1000'), true);
      expect(AzerbaijanUtils.validatePostalCode('az1000'), true); 
    });

    test('Invalid postal codes should fail', () {
      expect(AzerbaijanUtils.validatePostalCode('AZ12345'), false);
      expect(AzerbaijanUtils.validatePostalCode('1000'), false); 
      expect(AzerbaijanUtils.validatePostalCode('AZ'), false);
      expect(AzerbaijanUtils.validatePostalCode(''), false);
    });

    test('Postal code formatting should work', () {
      expect(AzerbaijanUtils.formatPostalCode('AZ1000'), 'AZ 1000');
      expect(AzerbaijanUtils.formatPostalCode('AZ100000'), 'AZ 100000');
      expect(AzerbaijanUtils.formatPostalCode('invalid'), null);
    });
  });

  group('Extension Methods', () {
    test('Phone number extensions should work', () {
      expect('+994501234567'.isValidAzPhoneNumber, true);
      expect('+994501234567'.formattedPhoneNumber, '+994501234567');
      expect('+994501234567'.phoneOperator, 'Azercell');
    });

    test('FIN extensions should work', () {
      expect('1AB2C3D'.isValidFIN, true);
      expect('ABCDEFG'.isValidFIN, false);
    });

    test('Vehicle plate extensions should work', () {
      expect('10AA123'.isValidVehiclePlate, true);
      expect('10AA123'.formattedVehiclePlate, '10-AA-123');
      expect('10AA123'.vehicleRegion, '10');
    });

    test('Postal code extensions should work', () {
      expect('AZ1000'.isValidPostalCode, true);
      expect('AZ1000'.formattedPostalCode, 'AZ 1000');
    });
  });
}