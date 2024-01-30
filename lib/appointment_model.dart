import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  String? name;
  String? surname;
  int? phone;
  DateTime? date;
  bool? isActive;

  AppointmentModel({
    this.name,
    this.surname,
    this.phone,
    this.date,
    this.isActive,
  });

  AppointmentModel copyWith({
    String? name,
    String? surname,
    int? phone,
    DateTime? date,
    bool? isActive,
  }) {
    return AppointmentModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      date: date ?? this.date,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'phone': phone,
      'date': date,
      'isActive': isActive,
    };
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phone: json['phone'] as int?,
      date: (json['date'] as Timestamp).toDate(),
      isActive: json['isActive'] as bool?,
    );
  }

  @override
  String toString() =>
      "PublicAppointment(name: $name,surname: $surname,phone: $phone,date: $date,isActive: $isActive)";

  @override
  int get hashCode => Object.hash(name, surname, phone, date, isActive);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppointmentModel &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              surname == other.surname &&
              phone == other.phone &&
              date == other.date &&
              isActive == other.isActive;
}
