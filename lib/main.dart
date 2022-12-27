import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/onboarding/landing.dart';
import 'package:provider/provider.dart';

import 'provider/auth_provider.dart';
import 'provider/vehicle_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ChangeNotifierProvider<VehicleProvider>(create: (_) => VehicleProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green )
              .copyWith(secondary: Colors.greenAccent),
        scaffoldBackgroundColor: Colors.grey,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.withOpacity(0.7)
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 9, color: Colors.grey[400]),
          headlineMedium: TextStyle(fontSize: 12, color: Colors.grey[400])
        )
      ),
      home: const LandingPage(), //LandingPage(),
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
