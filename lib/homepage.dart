import 'package:cloud_firestore/cloud_firestore.dart';
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
            Text('EMG Randevu', style: Theme.of(context).textTheme.headlineMedium),
            context.sized.emptySizedHeightBoxNormal,
            Container(
                width: context.sized.width*.5,
                height: context.sized.width*.3,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>DateSelect(
                    appointmentStream: FirebaseFirestore.instance.collection('privateAppointment').snapshots(),
                  )));
                }, child: Text('Genel Randevu'))),
            context.sized.emptySizedHeightBoxNormal,
            Container(
                width: context.sized.width*.5,
                height: context.sized.width*.3,
                child: ElevatedButton(onPressed: (){}, child: Text('Özel Randevu'))),
          ],
        ),
      ),
    );
  }
}
