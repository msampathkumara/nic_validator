class NICResult {
  final String nicNumber;
  final DateTime birthDate;
  final String gender;
  final String format; // "Old" or "New"
  final int age;
  final String? voterStatus; // "Voter" or "Non-Voter" (Old format only)

  NICResult({
    required this.nicNumber,
    required this.birthDate,
    required this.gender,
    required this.format,
    required this.age,
    this.voterStatus,
  });

  @override
  String toString() {
    return 'Format: $format\nDOB: ${birthDate.toLocal().toString().split(' ')[0]}\nGender: $gender\nAge: $age\nStatus: ${voterStatus ?? "N/A"}';
  }
}
