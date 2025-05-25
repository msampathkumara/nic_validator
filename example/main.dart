import 'dart:math';

import 'package:nic_validator/nic_validator.dart';

void main() {
  print('${Validators.validateNic('903154802v')}');
  print('${Validators.nicValidPattern()}');
}
