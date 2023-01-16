import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Dashboard/maintainance.dart';
import 'package:garage_repair/Screen/Dashboard/vehicle.dart';
import 'package:garage_repair/Screen/Dashboard/setting.dart';
import './dashboard_home.dart';

class Dashboard extends StatefulWidget {
  int currentIndex;
  Dashboard({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List pages = [
    const DashboardHome(),
    const Maintenance(),
    const Profile(),
    const Settings(),
  ];

  void onTap(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        unselectedLabelStyle:const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "manrope",
            fontSize: 8,
            height: 1.6,
            color: Color(0xffDADADA)),
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "manrope",
            fontSize: 8,
            color: Color(0xff180352)),
        currentIndex: widget.currentIndex,
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
              label: "Services", icon: Icon(Icons.car_repair)),
          BottomNavigationBarItem(
              label: "Vehicle", icon: Icon(Icons.car_crash_outlined)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
