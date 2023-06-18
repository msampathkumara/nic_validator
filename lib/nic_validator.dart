library nic_validator;

class Validators {
  static bool validateNic(value) {
    if (value.length == 12) {
      RegExp regex = RegExp(r'^(?=((?:19|20)?\d{2}(?:[0-35-8]\d\d(?!(?:000|500|36[7-9]|[7-9]\d|86[7-9]|8[7-9]\d)))\d{5})).*$');
      return regex.hasMatch(value);
    }
    if (value.length == 10) {
      RegExp regex = RegExp(r'^(1[0-9]|[2-9][0-9])(?:[0-35-8]\d\d(?!(?:000|500|36[7-9]|[7-9]\d|86[7-9]|8[7-9]\d)))(.{4}[vVxX])$');
      return regex.hasMatch(value);
    }
    return false;
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
