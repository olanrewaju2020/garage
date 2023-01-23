import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/inspection/sub_inspection.dart';
import 'package:garage_repair/Screen/Dashboard/maintainance.dart';
import 'package:garage_repair/service_locator.dart';
import '../map.dart'
    '';
import '../../Dashboard/vehicle.dart';
import '../Previous/previous.dart';
import '../Previous/previous_details.dart';

class FirstVehicleInspection extends StatefulWidget {
  const FirstVehicleInspection({Key? key}) : super(key: key);

  @override
  State<FirstVehicleInspection> createState() => _FirstVehicleInspectionState();
}

class _FirstVehicleInspectionState extends State<FirstVehicleInspection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f2),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
            size: 15,
          ),
        ),
        title: Text(
          'Previous Inspection',
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal),
        ),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListOfServices(services: app.servicesByOwner)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Inspection(),
          ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
