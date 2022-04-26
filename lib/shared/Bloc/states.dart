 import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class NewsStates
{
  const NewsStates();
}

class InitialNewsStates extends NewsStates{}
class AppChangeBottomNavBarState extends NewsStates{}
class AppChangeModeState extends NewsStates{}


class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
 }

class NewsGetSportLoadingState extends NewsStates{}
class NewsGetSportSuccessState extends NewsStates{}
class NewsGetSportErrorState extends NewsStates{
   final String error;
   NewsGetSportErrorState(this.error);
 }

class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
   final String error;
   NewsGetScienceErrorState(this.error);
 }
 class NewsGetSearchLoadingState extends NewsStates{}
 class NewsGetSearchSuccessState extends NewsStates{}
 class NewsGetSearchErrorState extends NewsStates{
   final String error;
   NewsGetSearchErrorState(this.error);
 }







