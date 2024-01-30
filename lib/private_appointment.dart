import 'package:emgsira/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PrivateAppointmentView extends StatelessWidget {
  PrivateAppointmentView({Key? key, required this.date, required this.appointmentCategory}) : super(key: key);
  final int date;
  final String appointmentCategory;
  TextEditingController name=TextEditingController();
  TextEditingController surname=TextEditingController();
  TextEditingController phone=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Özel Randevu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.padding.normal,
          child: Column(
            children: [
              CustomTextFormField(
                  controller: name,
                  labelText: 'Ad Giriniz'),
              context.sized.emptySizedHeightBoxLow,
              CustomTextFormField(
                  controller: surname,
                  labelText: 'Soyad Giriniz'),
              context.sized.emptySizedHeightBoxLow,
              CustomTextFormField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  labelText: 'Telefon Giriniz'),
              context.sized.emptySizedHeightBoxLow,

            ],
          ),
        ),
      ),
    );
  }
}
