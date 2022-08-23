class Doctor {
  final String name;
  final String speciality;

  Doctor(this.name, this.speciality);

  factory Doctor.fromMap(Map<String, dynamic> jsonResponse) {
    return Doctor(jsonResponse['doctor'], jsonResponse['area']);
  }
}
