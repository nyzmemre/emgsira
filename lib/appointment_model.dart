class AppointmentModel {
  String? name;
  String? surname;
  int? phone;
  int? day;
  int? month;
  int? year;
  bool? isActive;

  AppointmentModel({
    this.name,
    this.surname,
    this.phone,
    this.day,
    this.month,
    this.year,
    this.isActive,
  });

  AppointmentModel copyWith({
    String? name,
    String? surname,
    int? phone,
    int? day,
    int? month,
    int? year,
    bool? isActive,
  }) {
    return AppointmentModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
      isActive: isActive ?? this.isActive,
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
      'isActive': isActive,
    };
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phone: json['phone'] as int?,
      day: json['day'] as int?,
      month: json['month'] as int?,
      year: json['year'] as int?,
      isActive: json['isActive'] as bool?,
    );
  }

  @override
  String toString() =>
      "AppointmentModel(name: $name,surname: $surname,phone: $phone,day: $day,month: $month,year: $year,isActive: $isActive)";

  @override
  int get hashCode =>
      Object.hash(name, surname, phone, day, month, year, isActive);

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
              isActive == other.isActive;
}
