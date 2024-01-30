import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:emgsira/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({Key? key, required this.appointmentStream})
      : super(key: key);
  final Stream<QuerySnapshot<Map<String, dynamic>>>? appointmentStream;

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  int day=DateTime.now().day;
  int month=DateTime.now().month;
  int year=DateTime.now().year;
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
                EasyDateTimeLine(
                    locale: "tr_TR",
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate){
                      setState(() {
                        day=selectedDate.day;
                        month=selectedDate.month;
                        year=selectedDate.year;
                      });
                    },
                ),
                context.sized.emptySizedHeightBoxLow,
                Center(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Randevu Ekle'))),
                context.sized.emptySizedHeightBoxNormal,
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('publicAppointment')
                    .where('day', isEqualTo: day)
                    .where('month', isEqualTo: month)
                    .where('year', isEqualTo: year)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Veri yükleniyor, yüklenene kadar bekleyin
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Hata durumunda hatayı gösterin
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                        // Veri yoksa veya boşsa
                        return Text('Randevu Bulunmamaktadır.');
                      } else {
                        // Veri varsa
                        final List<AppointmentModel> appointments = snapshot.data!.docs.map((doc) {

                          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                          return AppointmentModel.fromJson(data);
                        }).toList();

                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: appointments.length,
                            itemBuilder: (context, int index) {

                              return Card(
                                margin: context.padding.normal,
                                child: ListTile(
                                  title: Text(appointments[index].name.toString()),
                                ),
                              );
                            }
                        );
                      }
                    })
              ],
            )),
      ),
    );
  }
}
