import 'package:flutter/material.dart';

void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
//---------Search url api------
//https://newsapi.org/v2/everything?q=tesla&apiKey=ff780098bab6417fb46e4c9abe37ace1

//------api url--------
// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=ff780098bab6417fb46e4c9abe37ace1
// Base URl : https://newsapi.org/
//method: v2/top-headlines?
//Quary :country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
