import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//collection references uses for create a collection inside DB
CollectionReference<Map<String, dynamic>> doctorsCollection =
    firebaseFirestore.collection("doctor");

CollectionReference<Map<String, dynamic>> usersCollection =
    firebaseFirestore.collection("users");

CollectionReference<Map<String, dynamic>> appointmentCollection =
    firebaseFirestore.collection("appointment");
