import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/g_button.dart';
import '../Components/Previous/previous.dart';
import '../Components/Previous/previous_details.dart';
import '../Components/maintenace/add_maintaince.dart';
import '../Components/maintenace/maintenance_history.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Colors.white,
          title: Text(
            'Maintance',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xfff4f4f2),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 15),
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
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
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
                                    decoration: BoxDecoration(
                                      color: Color(0xfff4f4f2),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Center(
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
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  hintStyle: const TextStyle(
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
                                              hintStyle:
                                                  const TextStyle(fontSize: 12),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 14.0,
                                                      bottom: 6.0,
                                                      top: 8.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                                              hintStyle:
                                                  const TextStyle(fontSize: 12),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 14.0,
                                                      bottom: 6.0,
                                                      top: 8.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                          child: const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(Icons.filter_alt,
                                  size: 20, color: Colors.green)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
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
                    height: 16,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PreviousDetails()));
                      },
                      child: const Previous())
                ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddMaintaincePlan(),
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
