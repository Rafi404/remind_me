import 'package:flutter/material.dart';
import 'view/reminder-page.dart';
//import 'package:reminder/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminder App',
      theme: ThemeData(
          primaryColor: Color(0xFF000A1F),
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          )),
      home: ReminderPage(),
    );
  }
}
