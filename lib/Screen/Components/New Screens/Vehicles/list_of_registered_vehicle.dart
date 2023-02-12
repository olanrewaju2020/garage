import 'package:flutter/material.dart';

class ListOfRegisteredVehicle extends StatefulWidget {
  const ListOfRegisteredVehicle({Key? key}) : super(key: key);

  @override
  State<ListOfRegisteredVehicle> createState() =>
      _ListOfRegisteredVehicleState();
}

class _ListOfRegisteredVehicleState extends State<ListOfRegisteredVehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: 20,
        ),
        title: Text(
          'Registered Vehicles ',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: Color(0xffEBEBEB),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List of Vehicles',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff646464),
                    fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 73,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/toyota.png'),
                            width: 90,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Toyota',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '14th of Feb,2022',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                          // ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.green,
                          //     ),
                          //     onPressed: () {},
                          //     child: Text(
                          //       'See Details',
                          //       style: TextStyle(fontSize: 8),
                          //     ))
                        ],
                      ),
                    ],
                  )),
              Divider(
                color: Color(0xff9D8E8E),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 73,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/bugatti.png'),
                            width: 90,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bugatti',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '14th of Feb,2017',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                          // ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.green,
                          //     ),
                          //     onPressed: () {},
                          //     child: Text(
                          //       'See Details',
                          //       style: TextStyle(fontSize: 8),
                          //     ))
                        ],
                      ),
                    ],
                  )),
              Divider(
                color: Color(0xff9D8E8E),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 73,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/byd.png'),
                            width: 90,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BYD',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '14th of Feb,2018',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                          // ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.green,
                          //     ),
                          //     onPressed: () {},
                          //     child: Text(
                          //       'See Details',
                          //       style: TextStyle(fontSize: 8),
                          //     ))
                        ],
                      ),
                    ],
                  )),
              Divider(
                color: Color(0xff9D8E8E),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 73,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/bentley.png'),
                            width: 90,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bentley',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '14th of Feb,2020',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                          // ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.green,
                          //     ),
                          //     onPressed: () {},
                          //     child: Text(
                          //       'See Details',
                          //       style: TextStyle(fontSize: 8),
                          //     ))
                        ],
                      ),
                    ],
                  )),
              Divider(
                color: Color(0xff9D8E8E),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Add to Vehicles',
                    style: TextStyle(color: Color(0xff21B24B)),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: Color(0xff21B24B)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
