import 'dart:convert';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.green,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              // color: Colors.blue.withOpacity(0.5),
                            ),
                            child: Column(
                              children: [
                                // show double value to 2 point
                                Text(
                                  "${double.parse(info["temp"]).toStringAsFixed(2)}°C",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${info["main"]}, ${info["city"]}",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "Feels: ${double.parse(info["feelsLike"]).toStringAsFixed(2)}°C",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "${info["humidity"]}%",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "H: ${double.parse(info["tempMin"]).toStringAsFixed(2)}°C  L: ${double.parse(info["tempMax"]).toStringAsFixed(2)}°C",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Colors.red.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Made by Momen Khandoker",style: TextStyle(
                          fontSize: 12,
                        ),),
                        Text("Data provided by OpenWeatherMap,org",style: TextStyle(
                          fontSize: 12,
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
