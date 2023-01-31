import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Dashboard/maintenance.dart';
import 'package:garage_repair/Screen/g_loader.dart';
import 'package:provider/provider.dart';

import '../../../provider/vehicle_provider.dart';
import '../../../service_locator.dart';

class History extends StatefulWidget {
  final String vehicleId;

  const History({Key? key, required this.vehicleId}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VehicleProvider>(context, listen: false)
          .fetchServiceByCar(vehicleId: widget.vehicleId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff4f4f2),
        body: Consumer<VehicleProvider>(builder: (context, provider, child) {
          return provider.isLoading
              ? const GLoader()
              : (app.servicesByCar.isEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 24),
                      alignment: Alignment.center,
                      child: const Text('No history'))
                  : ListOfServices(services: app.servicesByCar));
        }));
  }
}
