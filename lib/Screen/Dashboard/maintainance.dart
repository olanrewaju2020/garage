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
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Row(
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
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                            padding: const EdgeInsets.only(top: 50, right: 24, left: 24),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        autofocus: false,
                                        onTap: () {
                                          _showDatePicker(context);
                                        },
                                        style: const TextStyle(
                                            fontSize: 15.0, color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Start Date',
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
                                    const SizedBox(width: 30),
                                    Expanded(
                                      child: TextField(
                                        autofocus: false,
                                        onTap: () {
                                          _showDatePicker(context);
                                        },
                                        style: const TextStyle(
                                            fontSize: 15.0, color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'End Date',
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

                                  ],
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: double.infinity,
                                  child: TextField(
                                    autofocus: false,
                                    onTap: () {
                                    },
                                    style: const TextStyle(
                                        fontSize: 15.0, color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Vehicle Identification Number",
                                      label: const Text('VIN'),
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
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: double.infinity,
                                  child: TextField(
                                    autofocus: false,
                                    onTap: () {
                                    },
                                    style: const TextStyle(
                                        fontSize: 15.0, color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Select Cagetory",
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
                            )
                        );
                      });
                },
                child: Container(
                  width: 50,
                  child: const Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Icon(
                          Icons.filter_alt,
                          size: 20,
                          color: Colors.white
                      )),
                ),
              ),

            ],
          ),
        ),
        backgroundColor: const Color(0xfff4f4f2),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 45),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Maintenance History",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
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
              builder: (context) => AddMaintaincePlan(),
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
