import 'package:flutter/material.dart';
import 'package:garage_repair/service_locator.dart';
import 'package:provider/provider.dart';

import '../../../provider/vehicle_provider.dart';
import '../../Dashboard/maintenance.dart';
import '../maintenace/add_maintenance_2.dart';

class FirstVehicleRepairStage extends StatefulWidget {
  const FirstVehicleRepairStage({Key? key}) : super(key: key);

  @override
  State<FirstVehicleRepairStage> createState() =>
      _FirstVehicleRepairStageState();
}

class _FirstVehicleRepairStageState extends State<FirstVehicleRepairStage> {
  @override


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(app.servicesByOwner.isEmpty) {
        Provider.of<VehicleProvider>(context, listen: false)
            .getServiceByOwner(context: context);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
            size: 15,
          ),
        ),
        title: const Text(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListOfServices(services: app.servicesByOwner),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.green,
        onPressed: () {
          app.serviceType = 'Tolling';
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddMaintenance2(serviceType:
            app.serviceType ?? 'Tolling',),
          ));
        },
        child:  const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
