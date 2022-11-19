import 'package:flutter/material.dart';
import 'package:weather_app_2/Components/GetData.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String temp = "";
  String feelsLike = "";
  String humidity = "";
  String tempMin = "";
  String tempMax = "";
  String main = "";
  String city = "";
  String description = "";

  void startup() async{
    GetData instance = GetData(location: "rajshahi");
    await instance.getData();

    temp = instance.temp;
    feelsLike = instance.feelsLike;
    humidity = instance.humidity;
    tempMin = instance.tempMin;
    tempMax = instance.tempMax;
    main = instance.main;
    city = instance.city;
    description = instance.description;

    Navigator.pushReplacementNamed(context, "/home",arguments: {
      "temp" : temp,
      "feelsLike" : feelsLike,
      "humidity" : humidity,
      "tempMin" : tempMin,
      "tempMax" : tempMax,
      "main" : main,
      "city" : city,
      "description" : description,
    });
  }

  @override
  void initState() {
    startup();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Text("Loading"),
      )
    );
  }
}
