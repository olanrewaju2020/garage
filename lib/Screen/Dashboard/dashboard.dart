import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Dashboard/maintainance.dart';
import 'package:garage_repair/Screen/Dashboard/vehicle.dart';
import 'package:garage_repair/Screen/Dashboard/repair.dart';
import 'package:garage_repair/Screen/Dashboard/setting.dart';
import './insurance.dart';
import './dashboard_home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List pages = [
    DashboardHome(),
    Chat(),
    Profile(),
    Settings(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "manrope",
            fontSize: 8,
            height: 1.6,
            color: Color(0xffDADADA)),
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "manrope",
            fontSize: 8,
            color: Color(0xff180352)),
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        iconSize: 18,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
              label: "Maintainance", icon: Icon(Icons.car_repair_outlined)),
          BottomNavigationBarItem(
              label: "Vehicle", icon: Icon(Icons.car_crash_outlined)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
