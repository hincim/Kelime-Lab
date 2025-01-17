import 'package:flutter/material.dart';
import 'package:ilk_proje/controller/BottomNavigationController.dart';
import 'package:ilk_proje/controller/IndicatorController.dart';
import 'package:ilk_proje/controller/WordController.dart';
import 'package:ilk_proje/model/BottomNavigationModel.dart';
import 'package:ilk_proje/views/MainPage.dart';
import 'package:provider/provider.dart';
import 'package:ilk_proje/views/LoginPage.dart';

import 'controller/TrueFalseController.dart';
import 'model/IndicatorModel.dart';
import 'model/TrueFalseModel.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(  // Wrap the app with ProviderScope
      providers: [
        ChangeNotifierProvider(create: (context) => PasswordControllerLoginPage(TrueFalseModel())),
        ChangeNotifierProvider(create: (context) => PasswordController1(TrueFalseModel())),
        ChangeNotifierProvider(create: (context) => PasswordController2(TrueFalseModel())),
        ChangeNotifierProvider(create: (context) => IndicatorController(IndicatorModel())),
        ChangeNotifierProvider(create: (context) => BottomNavigationController(BottomNavigationModel())),
        ChangeNotifierProvider(create: (context) => SwappedController(TrueFalseModel())),
        ChangeNotifierProvider(create: (context) => WordController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kelime Lab',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Mainpage(),
      ),
    );
  }
}
