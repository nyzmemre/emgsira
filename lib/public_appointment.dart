import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emgsira/app_constants.dart';
import 'package:emgsira/appointment_model.dart';
import 'package:emgsira/custom_dropdown_menu.dart';
import 'package:emgsira/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PublicAppointmentView extends StatelessWidget {
  PublicAppointmentView(
      {Key? key,
      required this.day,
      required this.appointmentCategory,
      required this.month,
      required this.year})
      : super(key: key);
  final int day;
  final int month;
  final int year;
  final String appointmentCategory;
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController detail = TextEditingController();
  String selectedHour = '08';
  String selectedSecond = '00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.publicAppointment),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.padding.normal,
          child: Column(
            children: [
              CustomTextFormField(
                  controller: name, labelText: AppConstants.addName),
              context.sized.emptySizedHeightBoxLow,
              CustomTextFormField(
                  controller: surname, labelText: AppConstants.addSurname),
              context.sized.emptySizedHeightBoxLow,
              CustomTextFormField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  labelText: AppConstants.phoneNumber),
              context.sized.emptySizedHeightBoxLow,
              CustomTextFormField(labelText: AppConstants.appointmentDetail),
              context.sized.emptySizedHeightBoxLow,
              const Text(AppConstants.appointmentTime),
              context.sized.emptySizedHeightBoxLow,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomDropdownMenu(
                    list: List.generate(
                        24, (index) => index.toString().padLeft(2, '0')),
                    initialSelection: selectedHour,
                  ),
                  context.sized.emptySizedWidthBoxNormal,
                  CustomDropdownMenu(
                    list: List.generate(
                        60, (index) => index.toString().padLeft(2, '0')),
                    initialSelection: selectedSecond,
                  ),
                ],
              ),

              context.sized.emptySizedHeightBoxNormal,
              ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection(appointmentCategory)
                        .doc()
                        .set(AppointmentModel(
                                name: name.text,
                                surname: surname.text,
                                phone: int.parse(phone.text),
                                day: day,
                                month: month,
                                year: year,
                                hour: selectedHour,
                                second: selectedSecond,
                                isActive: true,


                    )
                            .toJson());
                  },
                  child: Text(AppConstants.addAppiontment))
            ],
          ),
        ),
      ),
    );
  }
}
