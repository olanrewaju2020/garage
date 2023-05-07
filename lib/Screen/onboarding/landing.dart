import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../Components/New Screens/New Services screen/book_machanic.dart';
import '../Components/New Screens/New Services screen/list_of_mechanic.dart';
import '../Components/New Screens/New Services screen/nearby_mechanic.dart';
import '../Components/New Screens/New Services screen/search_new.dart';
import '../Components/New Screens/Vehicles/new_vehicles.dart';
import '../Components/New Screens/maintenance_history_new.dart';
import '../Components/New Screens/maintenance_history_new_two.dart';
import '../Components/New Screens/services_new.dart';
import '../Dashboard/dashboard.dart';
import '../Dashboard/dashboard_home.dart';
import '../Dashboard/setting.dart';
import '../Settings/box_digit.dart';
import '../Settings/change_password_final.dart';
import 'onboarding_steps.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  OnBoardingSteps())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: Container(
              height: 250,
              width: 250,
              child: const Center(
                child: Image(image: AssetImage('assets/images/logo.png')),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
