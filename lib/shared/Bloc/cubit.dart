
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_project/modules/BusinessScreen/BusinessScreen.dart';
import 'package:newsapp_project/modules/ScienceScreen/ScienceScreen.dart';
import 'package:newsapp_project/modules/Setting/setting.dart';
import 'package:newsapp_project/modules/SportsScreen/SportsScreen.dart';
import 'package:newsapp_project/shared/Bloc/states.dart';

class NewsCubit extends Cubit<NewsStates>
{
 NewsCubit() : super(InitialNewsStates());
  static  NewsCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  List<Map> NewsTasks=[];
  List<Map> DoneTasks=[];
  List<Map> ArchiveTasks=[];
  List<Map> setting=[];




List<BottomNavigationBarItem> bottomNavigation= const [
 BottomNavigationBarItem(
 icon: Icon(Icons.business), label: 'Business'),
 BottomNavigationBarItem(
 icon: Icon(Icons.sports), label: 'Sports'),
 BottomNavigationBarItem(
 icon: Icon(Icons.science), label: 'Science'),
 BottomNavigationBarItem(
 icon: Icon(Icons.settings), label: 'Settings'),
 ];

  List<Widget> Screen = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    Setting(),

  ];

  void ChangeIndex(int index){
    CurrentIndex=index;
    emit(AppChangeBottomNavBarState());
  }



}
