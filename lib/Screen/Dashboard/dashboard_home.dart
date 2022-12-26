import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/details/quick.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../Components/inspection/inspection.dart';
import '../Components/repair/repairs.dart';
import '../Components/servicing/servicing.dart';
import '../Components/tow/tow.dart';
import 'insurance.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<AuthProvider>(context).user;
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
                GestureDetector(
                  onTap: () {
                    bottomsheet(context);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.green[300], shape: BoxShape.circle),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          )
                    ),
                  ),
                ),
                Text(
                  'Good morning \n${_user.firstName}.',
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
                    children: [
                      NewWidget(
                          title: 'Vehicle Inspection',
                          imageLog: 'assets/images/7.png',
                          route: FirstVehicleInspection()),
                      NewWidget(
                          title: 'Vehicle Servicing',
                          imageLog: 'assets/images/6.png',
                          route: FirstVehicleServices()),
                      NewWidget(
                          title: 'Rescue Service',
                          imageLog: 'assets/images/tow2.png',
                          route: Towing()),
                      NewWidget(
                          title: 'Vehicle Repair',
                          imageLog: 'assets/images/spanner.png',
                          route: FirstVehicleRepairStage()),
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
            builder: (context) => Quick(),
          ));
        },
      ),
    );
  }
}

void bottomsheet(context) {
  showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.70,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                        height: 45,
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
                        height: 55,
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
                        height: 55,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new Insurance()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [ Image.asset(
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
                        height: 55,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
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
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => route));
            },
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
