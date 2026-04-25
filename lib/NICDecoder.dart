import 'NICResult.dart';

class NICDecoder {
  static NICResult decode(String nic) {
    nic = nic.trim().toUpperCase();

    int year;
    int days;
    String format;
    String? voterStatus;

    if (nic.length == 10 && (nic.endsWith('V') || nic.endsWith('X'))) {
      // Old Format: 911042754V
      format = "Old";
      year = 1900 + int.parse(nic.substring(0, 2));
      days = int.parse(nic.substring(2, 5));
      voterStatus = nic.endsWith('V') ? "Voter" : "Non-Voter";
    } else if (nic.length == 12 && int.tryParse(nic) != null) {
      // New Format: 199110402754
      format = "New";
      year = int.parse(nic.substring(0, 4));
      days = int.parse(nic.substring(4, 7));
    } else {
      throw Exception("Invalid NIC Format");
    }

    // Determine Gender
    String gender = "Male";
    if (days > 500) {
      gender = "Female";
      days -= 500;
    }

    // Map days to Month and Date (Standard 366-day mapping)
    final dob = _calculateDate(year, days);

    // Calculate Age
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
      age--;
    }

    return NICResult(
      nicNumber: nic,
      birthDate: dob,
      gender: gender,
      format: format,
      age: age,
      voterStatus: voterStatus,
    );
  }

  static DateTime _calculateDate(int year, int days) {
    // Sri Lanka DRP uses a fixed 366-day year for indexing
    List<int> monthDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    int month = 0;
    int day = days;

    for (int i = 0; i < monthDays.length; i++) {
      if (day <= monthDays[i]) {
        month = i + 1;
        break;
      }
      day -= monthDays[i];
    }

    // Safety: If it's Feb 29 on a non-leap year, DateTime will normally
    // roll it to March 1st automatically, which is acceptable for most local systems.
    return DateTime(year, month, day);
  }
}
