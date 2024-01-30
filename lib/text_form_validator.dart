import 'package:flutter/material.dart';


@immutable
class TextFormValidator {
  const TextFormValidator._();

  ///formun boş olup olmadığını kontrol ediyor.
  static String? validateNotEmpty(String? value, String labelText){
    if(value==null || value.isEmpty) {
      return '$labelText Alan boş olamaz';
    }
    return null;
  }

  ///parola uzunluğunun en az 8 karakter olmasını sağlıyor.
  static String? checkPasswordLenght(String? value, String labelText){
    if(labelText=='Şifre' && value!=null) {
      if(value.length<7){
        return 'Şifre en az 8 haneli olmalıdır';
      }
    }
    return null;
  }

  ///email adresinin doğruluğunu kontrol ediyor.
  static String? validateEmail(String? value) {
    if(value != null && (!value.contains('@') || !value.contains('.com'))){
      return 'Email adresini doğru giriniz';
    }
    return null;
  }

  ///parolalar aynı mı kontrol ediyor.
  static String? validatePasswordMatch(String password, String confirmPassword){
    if(password!=confirmPassword) {
      return 'Parolalar aynı değil';
    }
    return null;
  }
}