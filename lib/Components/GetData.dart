import 'dart:convert';

import 'package:http/http.dart';

class GetData {
  String location = "";
  String temp = "";
  String feelsLike = "";
  String humidity = "";
  String tempMin = "";
  String tempMax = "";
  String main = "";
  String city = "";
  String description = "";

  GetData({required this.location}) {
    this.location = location;
  }

  Future<void> getData() async {
    try {
      String key = "2317a35c6a10c1657d739fcc89ce2f36";
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$key&units=metric"));
      Map data = jsonDecode(response.body);
      Map mainData = data["main"];
      Map weatherData = data["weather"][0];
      String getCity = data["name"];
      temp = mainData["temp"].toString();
      feelsLike = mainData["feels_like"].toString();
      humidity = mainData["humidity"].toString();
      tempMin = mainData["temp_min"].toString();
      tempMax = mainData["temp_max"].toString();
      main = weatherData["main"].toString();
      description = weatherData["description"].toString();
      city = getCity.toString();
    } on Exception catch (e) {
      temp = "N/A";
      feelsLike = "N/A";
      humidity = "N/A";
      tempMax = "N/A";
      tempMin = "N/A";
      main = "N/A";
      description = "N/A";
      city = "N/A";
      print("Error in getting data from api");
    }
  }
}
