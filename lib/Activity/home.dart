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
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(20, 100, 20, 100),
                  margin: EdgeInsets.all(40),
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.grey),
                        left: BorderSide(width: 1.0, color: Colors.grey),
                        right: BorderSide(width: 1.0, color: Colors.grey),
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                      // color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(150))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                // color: Colors.blue,
                                ),
                            child: Column(
                              children: [
                                // image
                                Image.network(
                                    "http://openweathermap.org/img/wn/${info['icon'].toString()}.png"),
                                // show double value to 2 point
                                Text(
                                  "${double.parse(info["temp"])}°C",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${info["description"]} in ${info["city"]}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                // Text(
                                //   "Feels: ${double.parse(info["feelsLike"])}°C",
                                //   style: TextStyle(fontSize: 12),
                                // ),
                                // Text(
                                //   "${info["humidity"]}%",
                                //   style: TextStyle(fontSize: 20),
                                // ),
                                // Text(
                                //   "H: ${double.parse(info["tempMin"])}°C  L: ${double.parse(info["tempMax"])}°C",
                                //   style: TextStyle(fontSize: 12),
                                // ),
                                TextField(
                                  textAlign: TextAlign.center,
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      if (searchController.text.isNotEmpty) {
                                        Navigator.pushNamed(context, "/loading",
                                            arguments: {
                                              "text": searchController.text,
                                            });
                                      }
                                    },
                                    child: Text("Search"))
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
