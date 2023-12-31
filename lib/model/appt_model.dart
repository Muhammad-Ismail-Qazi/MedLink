class AppointmentModel {
  late String uid;
  late String doctor;
  late String patient;
  late String reminderTime;
  late String watchTime;
  late DateTime date;
  late List urls;

  AppointmentModel({
    required this.uid,
    required this.doctor,
    required this.patient,
    required this.reminderTime,
    required this.watchTime,
    required this.date,
    required this.urls,
  });

  // Constructor to create DoctorModel from a map
  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      uid: map['uid'] ?? '',
      patient: map['patient'] ?? '',
      doctor: map['doctor'] ?? '',
      reminderTime: map['reminderTime'] ?? '',
      watchTime: map['watchTime'] ?? '',
      date: map['date'].toDate() ?? 0.0,
      urls: map['urls'] ?? [],
    );
  }

  // Method to convert DoctorModel to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'patient': patient,
      'doctor': doctor,
      'reminderTime': reminderTime,
      'watchTime': watchTime,
      'date': date,
      'urls': urls,
    };
  }
}
