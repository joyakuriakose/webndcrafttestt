import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webndcrafttest/constants.dart';
import 'package:webndcrafttest/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CircleAvatar(
                  child: Icon(Icons.account_circle_outlined),
                  radius: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CircularProgressIndicator(
                  backgroundColor: kPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
