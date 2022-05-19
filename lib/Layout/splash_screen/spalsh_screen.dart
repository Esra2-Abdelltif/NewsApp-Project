import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_project/Layout/HomeScreen.dart';
class SplashSCreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      duration: 400,
      splash: Column(children: [
        Image.asset('assests/images/news.jpg',width: 100,height: 100),
        SizedBox(height: 25,),
        Text('News App',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black54),)
      ]),
      nextScreen: HomeScreen(),
      splashIconSize: 250,
      splashTransition: SplashTransition.slideTransition,


    );

  }
}
