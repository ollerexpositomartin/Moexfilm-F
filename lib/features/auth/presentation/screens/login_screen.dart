import 'package:flutter/material.dart';
import 'package:moexfilm/features/auth/presentation/widgets/google_button.dart';

class LoginScreen extends StatelessWidget {
  static const String path = "/";
  static const String name = "Login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: 350,
          height: 350,
          color: Colors.red,
          child: Text("DIBUJITO"),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: const Text(
            "Your site to see ur content in High Quality",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        SizedBox(height: 120),
        GoogleButton(onPressed: () {})
      ],
    )));
  }
}
