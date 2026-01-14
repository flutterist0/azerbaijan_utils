
import 'package:azerbaijan_utils/azerbaijan_utils.dart';

void main() {
  print('=== AZERBAIJAN VALIDATOR EXAMPLES ===\n');
  
  print('📱 PHONE NUMBER VALIDATION:');
  
  List<String> phoneNumbers = [
    '+994501234567',
    '994501234567',
    '0501234567',
    '+994 50 123 45 67',
    '050-123-45-67',
    '+994701234567',
    '+994991234567',
    '+994101234567',
    '+994601234567',
    '+994401234567', 
    '123456789', 
  ];
  
  for (String phone in phoneNumbers) {  
    bool isValid = AzerbaijanUtils.validatePhoneNumber(phone);
    String? formatted = AzerbaijanUtils.formatPhoneNumber(phone);
    String? operator = AzerbaijanUtils.getPhoneOperator(phone);
    
    print('$phone -> Valid: $isValid');
    if (isValid) {
      print('  Formatted: $formatted');
      print('  Operator: $operator');
    }
    print('');
  }
  
  // ========== FIN VALIDATION ==========
  print('\n🆔 FIN CODE VALIDATION:');
  
  List<String> finCodes = [
    '1AB2C3D',
    'AA1BC2D',
    '7XYZABC',
    'ABCDEFG',
    '1234567', 
    '1AB2C3',  
    '1AB2C3DE', 
  ];
  
  for (String fin in finCodes) {
    bool isValid = AzerbaijanUtils.validateFIN(fin);
    print('$fin -> Valid: $isValid');
  }
  
  // ========== VEHICLE PLATE VALIDATION ==========
  print('\n🚗 VEHICLE PLATE VALIDATION:');
  
  List<String> plates = [
    '10-AA-123',
    '10AA123',
    '10 AA 123',
    '77-BB-999',
    '01-ZZ-001',
    'AA-10-123', 
    '100-AA-123', 
  ];
  
  for (String plate in plates) {
    bool isValid = AzerbaijanUtils.validateVehiclePlate(plate);
    String? formatted = AzerbaijanUtils.formatVehiclePlate(plate);
    String? region = AzerbaijanUtils.getVehicleRegion(plate);
    
    print('$plate -> Valid: $isValid');
    if (isValid) {
      print('  Formatted: $formatted');
      print('  Region: $region');
    }
    print('');
  }
  
  // ========== POSTAL CODE VALIDATION ==========
  print('\n📮 POSTAL CODE VALIDATION:');
  
  List<String> postalCodes = [
    'AZ1000',
    'AZ1001',
    'AZ100000',
    'AZ 1000',
    'az1000',
    'AZ12345', 
    '1000', 
  ];
  
  for (String code in postalCodes) {
    bool isValid = AzerbaijanUtils.validatePostalCode(code);
    String? formatted = AzerbaijanUtils.formatPostalCode(code);
    
    print('$code -> Valid: $isValid');
    if (isValid) {
      print('  Formatted: $formatted');
    }
    print('');
  }
  
  // ========== EXTENSION METHODS ==========
  print('\n🔧 EXTENSION METHODS:');
  
  String phone = '+994501234567';
  print('Phone: $phone');
  print('Is valid: ${phone.isValidAzPhoneNumber}');
  print('Formatted: ${phone.formattedPhoneNumber}');
  print('Operator: ${phone.phoneOperator}');
  
  print('');
  
  String fin = '1AB2C3D';
  print('FIN: $fin');
  print('Is valid: ${fin.isValidFIN}');
  
  print('');
  
  String plate = '10AA123';
  print('Plate: $plate');
  print('Is valid: ${plate.isValidVehiclePlate}');
  print('Formatted: ${plate.formattedVehiclePlate}');
  print('Region: ${plate.vehicleRegion}');
  
  print('');
  
  String postal = 'AZ1000';
  print('Postal: $postal');
  print('Is valid: ${postal.isValidPostalCode}');
  print('Formatted: ${postal.formattedPostalCode}');
}