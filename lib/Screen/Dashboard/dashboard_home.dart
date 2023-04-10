import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/details/quick.dart';
import 'package:provider/provider.dart';

import '../../misc/enum.dart';
import '../../provider/auth_provider.dart';
import '../Components/New Screens/New Services screen/repair_vehicle_new.dart';
import '../Components/New Screens/New Services screen/rescue_new.dart';
import '../Components/New Screens/New Services screen/service_list.dart';
import '../Components/New Screens/New Services screen/vehicle_inspection_new.dart';
import '../Components/New Screens/New Services screen/vehicle_servicing_new.dart';
import '../Components/repair/repairs.dart';
import '../Components/servicing/servicing.dart';
import '../Components/tow/tow.dart';
import 'dashboard.dart';
import 'insurance.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      body: Stack(
        children: [
          Container(
            height: size.height * .47,
            decoration: const BoxDecoration(color: Colors.green),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/images/ima.png'),
                            width: 45,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text.rich(TextSpan(
                            text: "Welcome, ",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                color: Color(0xffffffff)),
                            children: [
                              TextSpan(
                                text: "${user.firstName ?? "Talaba"} !",
                                style: const TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                        ],
                      ),
                      const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                    ]),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.circular(29.5)),
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        icon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .73,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                    children: const [
                      NewWidget(
                          title: 'Vehicle \nInspection',
                          imageLog: 'assets/images/7.png',
                          route: VehicleServicingNew(
                              serviceType: ServiceType.inspection,
                              title: 'Vehicle Inspection',
                              imageUrl: 'assets/images/box4.png')),
                      NewWidget(
                          title: 'Vehicle \nServicing',
                          imageLog: 'assets/images/6.png',
                          route: VehicleServicingNew(
                              serviceType: ServiceType.servicing,
                              title: 'Vehicle Servicing', imageUrl: 'assets/images/box2.png')),
                      NewWidget(
                          title: 'Rescue \nService',
                          imageLog: 'assets/images/tow2.png',
                          route: VehicleServicingNew(
                              serviceType: ServiceType.rescueService,
                              title: 'Rescue Service', imageUrl: 'assets/images/box3.png')),
                          // route: RescusNew()),
                      NewWidget(
                          title: 'Vehicle \nRepair',
                          imageLog: 'assets/images/spanner.png',
                          route: VehicleServicingNew(
                              serviceType: ServiceType.repair,
                              title: 'Repair Vehicle', imageUrl: 'assets/images/box1.png')),
                          // route: RepairVehicleNew()),
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
        backgroundColor: Colors.green,
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => const Quick(),
          // ));
        },
        child: const Icon(
          Icons.cable_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String imageLog;
  final String title;
  final Widget route;
  const NewWidget(
      {Key? key,
      required this.imageLog,
      required this.title,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => route));
            },
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    imageLog,
                    width: 100,
                  ),
                  SizedBox(height: 30),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
