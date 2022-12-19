import 'package:flutter/material.dart';
import 'package:se_380_project/Screens/home_page.dart';
import 'package:se_380_project/Screens/login_register_page.dart';
import 'package:se_380_project/auth.dart';
import 'package:se_380_project/main.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData)  {
          return MyAppp(); //HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}