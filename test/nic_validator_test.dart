import 'package:flutter_test/flutter_test.dart';
import 'package:nic_validator/nic_validator.dart';

void main() {
  test('adds one to input values', () {
    Validators.validateNic('903154802v');
  });
}
