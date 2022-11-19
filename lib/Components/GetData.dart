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

  Future<void> getData() async{
    String key = "2317a35c6a10c1657d739fcc89ce2f36";
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$key&units=metric"));
      Map data = jsonDecode(response.body);
      Map mainData = data["main"];
      Map weatherData = data["weather"][0];
      double getTemp = mainData["temp"];
      double getFeelsLike = mainData["feels_like"];
      double getTempMin = mainData["temp_min"];
      double getTempMax = mainData["temp_max"];
      String getCity = data["name"];
      temp = getTemp.toString();
      feelsLike = getFeelsLike.toString();
      humidity = mainData["humidity"].toString();
      tempMin = getTempMin.toString();
      tempMax = getTempMax.toString();
      main = weatherData["main"].toString();
      description = weatherData["description"].toString();
      city = getCity.toString();
    }catch(e){
      temp = "Data Not Found";
      feelsLike = "Data Not Found";
      humidity = "Data Not Found";
      tempMax = "Data Not Found";
      tempMin = "Data Not Found";
      main = "Data Not Found";
      description = "Data Not Found";
      city = "Data Not Found";
    }
  }
}