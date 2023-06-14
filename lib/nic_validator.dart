library nic_validator;

import 'dart:convert';

class Validators {
  static bool validateNic(value) {
    // RegExp regex = new RegExp(r'^(?=(.{9}[vVxX]|.{11}[0-9]))(?=((?:19|20)?\d{2}(?:[0-35-8]\d\d(?!(?:000|500|36[7-9]|3[7-9]\d|86[7-9]|8[7-9]\d)))\d{4}(?:[xXvV0-9]))).*$');
    RegExp regex = RegExp(r'^(?=(.{9}[vVxX]|.{11}[0-9]))(?=((?:19|20)?\d{2}(?:[0-35-8]\d\d(?!(?:000|500|36[7-9]|[7-9]\d|86[7-9]|8[7-9]\d)))\d{4}(?:[xXvV0-9]))).*$');
    // 775173769
    return regex.hasMatch(value);
  }

  static String? LkPhone(value) {
    RegExp regex = RegExp(r'^(0)(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)([0234579])|7([0125678])\d)\d{6}$');
    if (!regex.hasMatch(value)) {
      return "Enter valid phone number";
    } else {
      return null;
    }
  }
}
