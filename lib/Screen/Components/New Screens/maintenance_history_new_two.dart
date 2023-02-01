import 'package:flutter/material.dart';

class MaintenanceHistoryNewTwo extends StatefulWidget {
  const MaintenanceHistoryNewTwo({Key? key}) : super(key: key);

  @override
  State<MaintenanceHistoryNewTwo> createState() => _MaintenanceHistoryNewTwoState();
}

class _MaintenanceHistoryNewTwoState extends State<MaintenanceHistoryNewTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEBEBEB),
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 32,
          ),
          title: Text(
            'Maintenance History',
            style: TextStyle(
                color: Color(0xff282828),
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal),
          ),
          elevation: 0,
          backgroundColor: Color(0xffC3F6C1),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/toyota.png'),
                          width: 90,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Toyota',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff535865)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Mechanic",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Color(0xff646464)),
                            children: [
                              TextSpan(
                                text: ": Toba",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff21B24B)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Car Part",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": Radiator ",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Date",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": 14th of Feb,2022",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/toyota.png'),
                          width: 90,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Toyota',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff535865)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Mechanic",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Color(0xff646464)),
                            children: [
                              TextSpan(
                                text: ": Toba",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff21B24B)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Car Part",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": Radiator ",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Date",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": 14th of Feb,2022",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/toyota.png'),
                          width: 90,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Toyota',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff535865)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Mechanic",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Color(0xff646464)),
                            children: [
                              TextSpan(
                                text: ": Toba",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff21B24B)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Car Part",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": Radiator ",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Date",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": 14th of Feb,2022",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/toyota.png'),
                          width: 90,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Toyota',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff535865)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Mechanic",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Color(0xff646464)),
                            children: [
                              TextSpan(
                                text: ": Toba",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff21B24B)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Car Part",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": Radiator ",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Date",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": 14th of Feb,2022",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/toyota.png'),
                          width: 90,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Toyota',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff535865)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Mechanic",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Color(0xff646464)),
                            children: [
                              TextSpan(
                                text: ": Toba",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff21B24B)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Car Part",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": Radiator ",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Date",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": 14th of Feb,2022",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/toyota.png'),
                          width: 90,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Toyota',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff535865)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Mechanic",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Color(0xff646464)),
                            children: [
                              TextSpan(
                                text: ": Toba",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff21B24B)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Car Part",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": Radiator ",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Date",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": 14th of Feb,2022",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/toyota.png'),
                          width: 90,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Toyota',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff535865)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Mechanic",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Color(0xff646464)),
                            children: [
                              TextSpan(
                                text: ": Toba",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff21B24B)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Car Part",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": Radiator ",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(
                          text: "Date",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Color(0xff646464)),
                          children: [
                            TextSpan(
                              text: ": 14th of Feb,2022",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff21B24B)),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Divider()
            ],
          ),
        ),
      )
    );
  }
}
