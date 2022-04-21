import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp_project/Layout/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            //backwardsCompatibility: true,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
                color:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.italic
            ),

            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.dark

            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Color(0xFF8D8E98),
            backgroundColor: Colors.white,
            elevation: 20,
          )

      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

