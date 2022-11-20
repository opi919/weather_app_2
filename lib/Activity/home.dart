import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // search
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (searchController.text.isNotEmpty) {
                        Navigator.pushNamed(context, "/loading", arguments: {
                          "text": searchController.text,
                        });
                      }
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
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
                            decoration: const BoxDecoration(
                                // color: Colors.blue.withOpacity(0.5),
                                ),
                            child: Column(
                              children: [
                                // show double value to 2 point
                                Text(
                                  "${double.parse(info["temp"])}°C",
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${info["description"]} in ${info["city"]}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "Feels: ${double.parse(info["feelsLike"])}°C",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "${info["humidity"]}%",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "H: ${double.parse(info["tempMin"])}°C  L: ${double.parse(info["tempMax"])}°C",
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
                        Text(
                          "Made by Momen Khandoker",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Data provided by OpenWeatherMap,org",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
