class DoctorModel {
  late String uid;
  late String name;
  late String imgUrl;
  late List availability;
  late Map<dynamic, dynamic>? status;
  late dynamic ratings;
  late String designation;
  late dynamic rates;
  late String email;
  late String phone;
  late String experiance;
  late String institude;

//add new fields
  DoctorModel(
      {required this.uid,
      required this.name,
      required this.imgUrl,
      required this.availability,
      required this.ratings,
      required this.designation,
      required this.rates,
      this.status,
      required this.email,
      required this.experiance,
      required this.institude,
      required this.phone});

  // Constructor to create DoctorModel from a map
  DoctorModel.fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    name = map['name'];
    imgUrl = map['imgUrl'];
    availability = map['available_timings'];
    ratings = map['ratings'];
    designation = map['designation'];
    rates = map['rates'];
    status = map['status'];
    email = map['email'];
    phone = map['phone'];
    institude = map['institude'];
    experiance = map['experiance'];
  }

  // Method to convert DoctorModel to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'imgUrl': imgUrl,
      'available_timings': availability,
      'ratings': ratings,
      'designation': designation,
      'rates': rates,
      'status': status,
      'email': email,
      'phone': phone,
      'institude': institude,
      'experiance': experiance,
    };
  }
}
