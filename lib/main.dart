import 'package:flutter/material.dart';
import 'package:kelime_lab/controller/BottomNavigationController.dart';
import 'package:kelime_lab/controller/CounterCont%C4%B1oller.dart';
import 'package:kelime_lab/controller/IndicatorController.dart';
import 'package:kelime_lab/controller/WordController.dart';
import 'package:kelime_lab/cubit/TranslateCubit.dart';
import 'package:kelime_lab/model/BottomNavigationModel.dart';
import 'package:kelime_lab/views/MainPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'controller/TrueFalseController.dart';
import 'model/IndicatorModel.dart';
import 'model/TrueFalseModel.dart';


void main() async{
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(  // Wrap the app with ProviderScope
      providers: [
        BlocProvider(create: (context) => TranslateCubit(),),

        ChangeNotifierProvider(create: (context) => PasswordControllerLoginPage(TrueFalseModel())),
        ChangeNotifierProvider(create: (context) => PasswordController1(TrueFalseModel())),
        ChangeNotifierProvider(create: (context) => PasswordController2(TrueFalseModel())),
        ChangeNotifierProvider(create: (context) => IndicatorController(IndicatorModel())),
        ChangeNotifierProvider(create: (context) => BottomNavigationController(BottomNavigationModel())),
        ChangeNotifierProvider(create: (context) => SwappedController(TrueFalseModel())),
        ChangeNotifierProvider(create: (context) => WordController(),),
        ChangeNotifierProvider(create: (context) => TextFieldController(TrueFalseModel()),),
        ChangeNotifierProvider(create: (context) => DroppedController(TrueFalseModel()),),
        ChangeNotifierProvider(create: (context) => SearchWidgetController(TrueFalseModel()),),
        ChangeNotifierProvider(create: (context) => ClickedController(TrueFalseModel()),),
        ChangeNotifierProvider(create: (context) => CounterController()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kelime Lab',
        theme: ThemeData(
          fontFamily: "JoseFinSans",
          primarySwatch: Colors.blue,
        ),
        home: Mainpage(),
      ),
    );

  }
}
