import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String firstName;
  final String lastNameP;
  final String lasNameM;
  final String email;
  final String phoneNumber;
  final String school;
  final String facility;
  final String motive;
  User({
    required this.id,
    required this.firstName,
    required this.lastNameP,
    required this.lasNameM,
    required this.email,
    required this.phoneNumber,
    required this.school,
    required this.facility,
    required this.motive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastNameP': lastNameP,
      'lasNameM': lasNameM,
      'email': email,
      'phoneNumber': phoneNumber,
      'school': school,
      'facility': facility,
      'motive': motive,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['ID'] as String,
      firstName: map['firstName'] as String,
      lastNameP: map['lastNameP'] as String,
      lasNameM: map['lasNameM'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      school: map['school'] as String,
      facility: map['facility'] as String,
      motive: map['motive'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
