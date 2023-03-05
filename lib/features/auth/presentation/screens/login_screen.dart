import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String path = "/";
  static const String name = "Login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: 350,
          height: 350,
          color: Colors.red,
          child: Text("DIBUJITO"),
        ),
        const Text(
          "Your site to see ur content in High Quality",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        OutlinedButton(onPressed: () {}, child: Text("Login With Google"))
      ],
    )));
  }
}
