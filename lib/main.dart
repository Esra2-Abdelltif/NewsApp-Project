import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp_project/Layout/HomeScreen.dart';
import 'package:newsapp_project/shared/Bloc/observer_bloc.dart';
import 'package:newsapp_project/shared/Network/remote/dio_helper.dart';
import 'package:newsapp_project/shared/theme/Bloc/cubit.dart';
import 'package:newsapp_project/shared/theme/Bloc/states.dart';


void main() {
  DioHelper.init();
  BlocOverrides.runZoned( () {
      runApp(const MyApp());

    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context )=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
       listener: (context ,state){},
        builder: (context ,state){
         return  MaterialApp(

           theme: ThemeData(
               primarySwatch: Colors.deepOrange,
               scaffoldBackgroundColor: Colors.white,
               appBarTheme: Theme.of(context).appBarTheme.copyWith(
                 titleSpacing: 15,
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
                   statusBarIconBrightness:Brightness.dark,
                   // statusBarBrightness: Brightness.dark,

                 ),
               ),
               bottomNavigationBarTheme: BottomNavigationBarThemeData(
                 type: BottomNavigationBarType.fixed,
                 selectedItemColor: Colors.deepOrange,
                 unselectedItemColor: Color(0xFF8D8E98),
                 backgroundColor: Colors.white,
                 elevation: 20,
               ),
               textTheme: TextTheme(
                 bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black),
                 bodyText2:  TextStyle(fontSize: 16, color: Colors.black),

               )


           ),
           darkTheme: ThemeData(
               primarySwatch: Colors.deepOrange,
               scaffoldBackgroundColor: HexColor('333739'),
               appBarTheme: Theme.of(context).appBarTheme.copyWith(
                 titleSpacing: 15,
                 iconTheme: IconThemeData(color: Colors.white),
                 backwardsCompatibility: false,
                 backgroundColor:HexColor('333739'),
                 elevation: 0,
                 titleTextStyle: TextStyle(
                   color:Colors.white,
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   //fontStyle: FontStyle.italic
                 ),
                 systemOverlayStyle: SystemUiOverlayStyle(
                   statusBarColor: HexColor('333739'),
                   statusBarIconBrightness:Brightness.light,
                   // statusBarBrightness: Brightness.dark,

                 ),
               ),
               bottomNavigationBarTheme: BottomNavigationBarThemeData(
                 type: BottomNavigationBarType.fixed,
                 selectedItemColor: Colors.deepOrange,
                 unselectedItemColor: Color(0xFF8D8E98),
                 backgroundColor:HexColor('333739'),
                 elevation: 20,
               ),
               textTheme: TextTheme(
                 bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white),
                 bodyText2:  TextStyle(fontSize: 16, color: Colors.white),
               )

           ),
           themeMode: AppCubit.get(context).IsDark ? ThemeMode.dark :ThemeMode.light,
           debugShowCheckedModeBanner: false,

           home: HomeScreen(),
         );
        },
      ),
    );
  }
}

