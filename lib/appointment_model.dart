class AppointmentModel {
  String name;
  String surname;
  int phone;
  int day;
  int month;
  int year;
  String hour;
  String second;
  bool isActive;
  String? detail;

  AppointmentModel({
   required this.name,
   required this.surname,
   required this.phone,
   required this.day,
   required this.month,
   required this.year,
   required this.hour,
   required this.second,
   required this.isActive,
    this.detail,
  });

  AppointmentModel copyWith({
   required String name,
   required String surname,
   required int phone,
   required int day,
   required int month,
   required int year,
   required String hour,
   required String second,
   required bool isActive,
    String? detail,
  }) {
    return AppointmentModel(
      name: name,
      surname: surname,
      phone: phone,
      day: day,
      month: month,
      year: year,
      hour: hour,
      second: second,
      isActive: isActive,
      detail: detail,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'phone': phone,
      'day': day,
      'month': month,
      'year': year,
      'hour': hour,
      'second': second,
      'isActive': isActive,
      'detail': detail,
    };
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      name: json['name'] as String,
      surname: json['surname'] as String,
      phone: json['phone'] as int,
      day: json['day'] as int,
      month: json['month'] as int,
      year: json['year'] as int,
      hour: json['hour'] as String,
      second: json['second'] as String,
      isActive: json['isActive'] as bool,
      detail: json['detail'] as String?,
    );
  }

  @override
  String toString() =>
      "AppointmentModel(name: $name,surname: $surname,phone: $phone,day: $day,month: $month,year: $year,hour: $hour,second: $second,isActive: $isActive, detail: $detail)";

  @override
  int get hashCode =>
      Object.hash(name, surname, phone, day, month, year,hour,second, isActive, detail);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppointmentModel &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              surname == other.surname &&
              phone == other.phone &&
              day == other.day &&
              month == other.month &&
              year == other.year &&
              hour == other.hour &&
              second == other.second &&
              isActive == other.isActive &&
              detail == other.detail;
}
