import 'package:flutter/material.dart';


class Localtion extends StatefulWidget {
  const Localtion({Key? key}) : super(key: key);

  @override
  State<Localtion> createState() => _LocaltionState();
}

class _LocaltionState extends State<Localtion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Location Activity"),
    );
  }
}
