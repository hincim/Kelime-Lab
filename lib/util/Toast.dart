import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,  // Gösterilecek mesaj
    toastLength: Toast.LENGTH_SHORT,  // Mesajın ne kadar süreyle görüneceği
    gravity: ToastGravity.BOTTOM,  // Mesajın konumu: BOTTOM, CENTER, TOP
    timeInSecForIosWeb: 1,  // iOS/Web için gösterim süresi
    backgroundColor: Colors.black.withOpacity(0.7),  // Arka plan rengi
    textColor: Colors.white,  // Yazı rengi
    fontSize: 16.0,  // Yazı boyutu
  );
}

