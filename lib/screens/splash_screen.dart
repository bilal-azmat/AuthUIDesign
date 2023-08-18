
import 'dart:async';

import 'package:auth_ui_tutorial/screens/login_screen.dart';
import 'package:auth_ui_tutorial/theme.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: primaryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Splash Screen",
            style: heading2.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            )
          ],
        ),
      ),

    );
  }
}
