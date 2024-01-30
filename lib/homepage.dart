import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emgsira/app_constants.dart';
import 'package:emgsira/date_select.dart';
import 'package:emgsira/public_appointment.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppConstants.appName, style: Theme.of(context).textTheme.headlineMedium),
            context.sized.emptySizedHeightBoxNormal,
            Container(
                width: context.sized.width*.5,
                height: context.sized.width*.3,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>DateSelect(
                    appointmentSnap: FirebaseFirestore.instance.collection('publicAppointment'),
                    appointmentCategory: 'publicAppointment',
                  )));
                }, child: Text('Genel Randevu'))),
            context.sized.emptySizedHeightBoxNormal,
            Container(
                width: context.sized.width*.5,
                height: context.sized.width*.3,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>DateSelect(
                    appointmentSnap: FirebaseFirestore.instance.collection('privateAppointment'),
                    appointmentCategory: 'privateAppointment',
                  )));
                }, child: Text('Özel Randevu'))),
          ],
        ),
      ),
    );
  }
}
