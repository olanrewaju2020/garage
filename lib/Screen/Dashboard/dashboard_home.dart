import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/quick.dart';
import '../Components/first_vehicle_inspection.dart';
import '../Components/first_vehicle_repair.dart';
import '../Components/first_vehicle_servicing.dart';
import '../Components/vehicle_repair.dart';
import '../Components/vehicle_inspection.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f2),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(color: Colors.green),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.green[300], shape: BoxShape.circle),
                    child: GestureDetector(
                        onTap: () {
                          bottomsheet(context);
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                  ),
                ),
                Text(
                  'Good morning \nOlanrewaju.',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.normal),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        icon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: const [
                      NewWidget(
                        title: 'Vehicle Inspection',
                        imageLog: 'assets/images/7.png',
                      ),
                      NewWidget(
                        title: 'Vehicle Servicing',
                        imageLog: 'assets/images/6.png',
                      ),
                      NewWidget(
                        title: 'Rescue Service',
                        imageLog: 'assets/images/tow2.png',
                      ),
                      NewWidget(
                        title: 'Vehicle Repair',
                        imageLog: 'assets/images/spanner.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(
          Icons.headset_mic_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FirstVehicleInspection(),
          ));
        },
      ),
    );
  }
}

void bottomsheet(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
            height: 481 - 74.0,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/5a.png',
                                height: 45,
                                width: 45,
                              ),
                              Text(
                                'Vehicle Servicing',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/inspec.png',
                                height: 45,
                                width: 45,
                              ),
                              Text(
                                'Vehicle Inspection',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/carrr.png',
                                height: 40,
                                width: 50,
                              ),
                              Text(
                                'Rescue Service',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/par.png',
                                height: 35,
                                width: 35,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Vehicle Repair',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/in.png',
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Vehicle Insurance',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/part.png',
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Vehicle Parts',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/cop.png',
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                'Cooperative',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
}

class NewWidget extends StatelessWidget {
  final String imageLog;
  final String title;
  const NewWidget({
    Key? key,
    required this.imageLog,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    imageLog,
                    width: 100,
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
