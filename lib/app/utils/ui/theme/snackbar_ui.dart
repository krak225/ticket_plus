import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUi {

  static void error(message,{Duration? duration}){
    Get.snackbar('Erreur', '$message',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 50,
        margin: EdgeInsets.all(10),
        colorText: Colors.white,
        duration: duration ?? Duration(seconds: 5),
        icon: Icon(Icons.error, color: Colors.white));
  }

  static void warning(message,{Duration? duration}){
    Get.snackbar('Attention', '$message',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        borderRadius: 50,
        margin: EdgeInsets.all(10),
        colorText: Colors.white,
        duration: duration ?? Duration(seconds: 5),
        icon: Icon(Icons.lock, color: Colors.white));
  }

  static void success(message,{Duration? duration}){
    Get.snackbar('Succès', '$message',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 50,
        margin: EdgeInsets.all(10),
        colorText: Colors.white,
        duration: duration ?? Duration(seconds: 5),
        icon: Icon(Icons.check_circle, color: Colors.white));
  }

  static void info(message,{Duration? duration}){
    Get.snackbar('Info', '$message',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        borderRadius: 50,
        margin: EdgeInsets.all(10),
        colorText: Colors.white,
        duration: duration ?? Duration(seconds: 5),
        icon: Icon(Icons.info, color: Colors.white));
  }
}