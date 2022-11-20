import 'package:flutter/material.dart';
import 'package:weather_app_2/Components/GetData.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String input = "rajshahi";
  String temp = "";
  String feelsLike = "";
  String humidity = "";
  String tempMin = "";
  String tempMax = "";
  String main = "";
  String city = "";
  String description = "";
  String icon = "";

  void startup(String input) async {
    GetData instance = GetData(location: input);
    await instance.getData();

    temp = instance.temp;
    feelsLike = instance.feelsLike;
    humidity = instance.humidity;
    tempMin = instance.tempMin;
    tempMax = instance.tempMax;
    main = instance.main;
    city = instance.city;
    description = instance.description;
    icon = instance.icon;

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "temp": temp,
      "feelsLike": feelsLike,
      "humidity": humidity,
      "tempMin": tempMin,
      "tempMax": tempMax,
      "main": main,
      "city": city,
      "description": description,
      "icon": icon,
    });
  }

  @override
  void initState() {
    super.initState();
    // print("this is init state");
  }

  @override
  Widget build(BuildContext context) {
    try {
      Map data = ModalRoute.of(context)?.settings.arguments as Map;
      input = data["text"];
    } catch (e) {
      print(e);
    }
    startup(input);
    return Scaffold(
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    "HamroMausam",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
