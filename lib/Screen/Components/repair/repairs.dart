import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/repair/sub_repair.dart';

import '../../Dashboard/vehicle.dart';
import '../Previous/previous.dart';
import '../Previous/previous_details.dart';

class FirstVehicleRepairStage extends StatefulWidget {
  const FirstVehicleRepairStage({Key? key}) : super(key: key);

  @override
  State<FirstVehicleRepairStage> createState() =>
      _FirstVehicleRepairStageState();
}

class _FirstVehicleRepairStageState extends State<FirstVehicleRepairStage> {
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
          'Previous Vehicle repair',
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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PreviousDetails()));
                  },
                  child: Previous()))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VehicleRepair(),
          ));
        },
      ),
    );
  }
}
