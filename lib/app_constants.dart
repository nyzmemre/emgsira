
import 'package:flutter/material.dart';

@immutable
class AppConstants{
  const AppConstants._();

  static const String appName='EMG Randevu';
  static const String addAppiontment='Randevu Ekle';
  static const String selectDate='Tarih Seçiniz';
  static const String publicAppointment='Genel Randevu';
  static const String privateAppointment='Özel Randevu';
  static const String addName='Ad Giriniz';
  static const String addSurname='Soyad Giriniz';
  static const String phoneNumber='Telefon Giriniz';
  static const String appointmentTime='Randevu Saati';
  static const String appointmentDetail='Varsa Randevu Notu';
  static const String appointmentNotFound='Randevu Bulunmamaktadır.';


  ///Database Constant
  static const String publicAppointmentTEXT='publicAppointment';
  static const String privateAppointmentTEXT='privateAppointment';
}