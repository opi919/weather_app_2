
import 'package:flutter/material.dart';
import 'package:weather_app_2/Activity/home.dart';
import 'package:weather_app_2/Activity/loading.dart';
import 'package:weather_app_2/Activity/location.dart';

void main(){
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
    },
  ));
}