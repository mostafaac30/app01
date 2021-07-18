import 'package:app01/modules/bmi/bmi_screen.dart';
import 'package:app01/modules/counter/counter.dart';
import 'package:app01/modules/login/LoginScreen.dart';
import 'package:app01/shared/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'layout/home_layout.dart';
import 'modules/bmi_result/bmiResult_screen.dart';
import 'modules/users/users_screen.dart';

main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Splitter by Mostafa',
/*       theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
 */ //title: 'BMI calculator',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(primaryColor: Color.fromRGBO(38, 192, 171, 1)),
      home: HomeLayout(),
    );
  }
}
