import 'package:flutter/material.dart';
import 'package:garage_repair/Models/service.dart';
import 'package:garage_repair/Screen/Components/g_button.dart';
import 'package:garage_repair/Screen/g_loader.dart';
import 'package:provider/provider.dart';
import '../../provider/vehicle_provider.dart';
import '../../service_locator.dart';
import '../Components/Previous/previous.dart';
import '../Components/Previous/previous_details.dart';
import '../Components/maintenace/add_maintaince.dart';
import '../Components/maintenace/add_maintenance_2.dart';

class Maintenance extends StatefulWidget {
  const Maintenance({Key? key}) : super(key: key);

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (app.servicesByOwner.isEmpty) {
        Provider.of<VehicleProvider>(context, listen: false)
            .getServiceByOwner(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Colors.white,
          title: const Text(
            'Maintance',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xfff4f4f2),
        body: Consumer<VehicleProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              autofocus: true,
                              style: const TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search vehicle',
                                hintStyle: const TextStyle(fontSize: 12),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 6.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                        padding: const EdgeInsets.only(
                                            top: 0, right: 24, left: 24),
                                        decoration: const BoxDecoration(
                                            color: Color(0xfff4f4f2),
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(25))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            const Center(
                                              child: Text(
                                                'Advance Search',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    letterSpacing: 0.4,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    autofocus: false,
                                                    onTap: () {
                                                      _showDatePicker(context);
                                                    },
                                                    style: const TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: 'Start Date',
                                                      hintStyle:
                                                          const TextStyle(
                                                              fontSize: 12),
                                                      filled: true,
                                                      fillColor: Colors.white70,
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 14.0,
                                                              bottom: 6.0,
                                                              top: 8.0),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: TextField(
                                                    autofocus: false,
                                                    onTap: () {
                                                      _showDatePicker(context);
                                                    },
                                                    style: const TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: 'End Date',
                                                      hintStyle:
                                                          const TextStyle(
                                                              fontSize: 12),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 14.0,
                                                              bottom: 6.0,
                                                              top: 8.0),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 24),
                                            SizedBox(
                                              width: double.infinity,
                                              child: TextField(
                                                autofocus: false,
                                                onTap: () {},
                                                style: const TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Vehicle Identification Number",
                                                  label: const Text('VIN'),
                                                  hintStyle: const TextStyle(
                                                      fontSize: 12),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 14.0,
                                                          bottom: 6.0,
                                                          top: 8.0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            SizedBox(
                                              width: double.infinity,
                                              child: TextField(
                                                autofocus: false,
                                                onTap: () {},
                                                style: const TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Select Cagetory",
                                                  hintStyle: const TextStyle(
                                                      fontSize: 12),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 14.0,
                                                          bottom: 6.0,
                                                          top: 8.0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            SizedBox(
                                              width: double.infinity,
                                              child: GButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  label: "Search"),
                                            )
                                          ],
                                        ));
                                  });
                            },
                            child: Container(
                              width: 30,
                              padding: const EdgeInsets.only(left: 10.0),
                              child: const Icon(Icons.filter_alt,
                                  size: 20, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Maintenance History",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            fontStyle: FontStyle.normal),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListOfServices(services: app.servicesByOwner)
                    ]),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.green,
          onPressed: () {
            app.serviceType = 'Repair';
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  AddMaintenance2(serviceType: app.serviceType ?? 'Repair'),
            ));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ListOfServices extends StatelessWidget {
  List<GService> services;
  ListOfServices({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleProvider>(
      builder: (context, provider, child) {
        return provider.isLoading == true
            ? const GLoader()
            : SingleChildScrollView(
                child: Column(
                    children: List.generate(
                        services.length,
                        (index) => Previous(
                            service: services[index],
                            route: PreviousDetails(service: services[index]),))),
              );
      },
    );
  }
}
