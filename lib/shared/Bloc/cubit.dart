
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_project/modules/BusinessScreen/BusinessScreen.dart';
import 'package:newsapp_project/modules/ScienceScreen/ScienceScreen.dart';
import 'package:newsapp_project/modules/Setting/setting.dart';
import 'package:newsapp_project/modules/SportsScreen/SportsScreen.dart';
import 'package:newsapp_project/shared/Bloc/states.dart';
import 'package:newsapp_project/shared/Network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
 NewsCubit() : super(InitialNewsStates());
  static  NewsCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
 List<dynamic> Business =[];
 List<dynamic> Science =[];
 List<dynamic> Sport =[];

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
    if (index==1)getSport();
    if (index==2)getScience();

    emit(AppChangeBottomNavBarState());
  }
  bool IsDark=false;
  void ChangeAppMode(){
    IsDark = !IsDark;
    emit(AppChangeModeState());
  }

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        Url: 'v2/top-headlines',
        Quary: {
          'country':'eg',
          'category':'business',
          'apiKey':'ff780098bab6417fb46e4c9abe37ace1'

        },
    ).then((value) {
      Business=value.data['articles'];
      print(Business[0]['title']);
      emit(NewsGetBusinessSuccessState());


    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));


    });

  }
  void getSport(){
   emit(NewsGetSportLoadingState());
   if(Sport.length==0){
     DioHelper.getData(
       Url: 'v2/top-headlines',
       Quary: {
         'country':'eg',
         'category':'sport',
         'apiKey':'ff780098bab6417fb46e4c9abe37ace1'

       },
     ).then((value) {
      Sport=value.data['articles'];
       print(Sport[0]['title']);
       emit(NewsGetSportSuccessState());


     }).catchError((error){
       print(error.toString());
       emit(NewsGetSportErrorState(error.toString()));


     });
   }
   else{
     emit(NewsGetSportSuccessState());

   }


 }
  void getScience(){
   emit(NewsGetScienceLoadingState());

  if(Science.length==0){
  DioHelper.getData(
    Url: 'v2/top-headlines',
    Quary: {
      'country':'eg',
      'category':'science',
      'apiKey':'ff780098bab6417fb46e4c9abe37ace1'

    },
  ).then((value) {
   Science=value.data['articles'];
    print(Science[0]['title']);
    emit(NewsGetScienceSuccessState());


  }).catchError((error){
    print(error.toString());
    emit(NewsGetScienceErrorState(error.toString()));


  });
}
else{
  emit(NewsGetScienceSuccessState());

}
 }



}
