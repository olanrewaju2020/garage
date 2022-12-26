import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Dashboard/dashboard.dart';
import 'package:garage_repair/Screen/Dashboard/dashboard_home.dart';
import 'package:garage_repair/Screen/onboarding/create_account.dart';
import 'package:garage_repair/Screen/onboarding/landing.dart';
import 'package:garage_repair/Screen/onboarding/login.dart';
import 'package:garage_repair/Screen/onboarding/onboarding_steps.dart';
import 'package:provider/provider.dart';

import 'Screen/Dashboard/google_map_screen.dart';
import 'provider/auth_provider.dart';
import 'provider/vehicle_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ChangeNotifierProvider<VehicleProvider>(create: (_) => VehicleProvider()),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(), //LandingPage(),
    ),
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
