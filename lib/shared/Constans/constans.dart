import 'package:flutter/material.dart';

void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// Base URl : https://newsapi.org/
//method: v2/top-headlines?
//Quary :country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
