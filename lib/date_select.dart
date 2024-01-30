import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:emgsira/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DateSelect extends StatelessWidget {
  const DateSelect({Key? key, required this.appointmentStream})
      : super(key: key);
  final Stream<QuerySnapshot<Map<String, dynamic>>>? appointmentStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarih Seçiniz'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: context.padding.normal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyDateTimeLine(initialDate: DateTime.now()),
                context.sized.emptySizedHeightBoxLow,
                Center(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Randevu Ekle'))),
                context.sized.emptySizedHeightBoxNormal,
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('privateAppointment')
                        .where('date', isEqualTo: DateTime.now().day)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {

                        return Card(
                          margin: context.padding.normal,
                          child: ListTile(
                            title: Text(snapshot.data!.docs.toString()),
                          ),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EasyDateTimeLine(initialDate: DateTime.now()),
                            context.sized.emptySizedHeightBoxLow,
                            Center(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Randevu Ekle'))),
                            context.sized.emptySizedHeightBoxNormal,
                            Text('Randevu Bulunmamaktadır.'),
                          ],
                        );
                      }
                    })
              ],
            )),
      ),
    );
  }
}
