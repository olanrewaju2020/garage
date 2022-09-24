import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Dashboard/dashboard.dart';
import 'package:garage_repair/Screen/Dashboard/dashboard_home.dart';
import 'package:garage_repair/Screen/onboarding/create_account.dart';
import 'package:garage_repair/Screen/onboarding/landing.dart';
import 'package:garage_repair/Screen/onboarding/login.dart';
import 'package:garage_repair/Screen/onboarding/onboarding_steps.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LandingPage(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
