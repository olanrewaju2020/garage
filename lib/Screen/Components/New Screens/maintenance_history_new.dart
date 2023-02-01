import 'package:flutter/material.dart';

class MaintenanceHistoryNew extends StatefulWidget {
  const MaintenanceHistoryNew({Key? key}) : super(key: key);

  @override
  State<MaintenanceHistoryNew> createState() => _MaintenanceHistoryNewState();
}

class _MaintenanceHistoryNewState extends State<MaintenanceHistoryNew> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 18),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(29.5)),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Search  by date  ',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(12, 12, 12, 0.22),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal),
                      icon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(0, 0, 0, 0.22),
                      ),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                    height: 115,
                    width: 260,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(11)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/toyota.png'),
                              width: 70,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Toyota',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
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
                            Text(
                              'General service',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '14th of Feb,2022',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'See Details',
                                  style: TextStyle(fontSize: 8),
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                    height: 115,
                    width: 260,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(11)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/toyota.png'),
                              width: 70,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Toyota',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
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
                            Text(
                              'General service',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '14th of Feb,2022',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'See Details',
                                  style: TextStyle(fontSize: 8),
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                    height: 115,
                    width: 260,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(11)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/toyota.png'),
                              width: 70,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Toyota',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
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
                            Text(
                              'General service',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '14th of Feb,2022',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'See Details',
                                  style: TextStyle(fontSize: 8),
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                    height: 115,
                    width: 260,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(11)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/toyota.png'),
                              width: 70,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Toyota',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
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
                            Text(
                              'General service',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '14th of Feb,2022',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'See Details',
                                  style: TextStyle(fontSize: 8),
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                    height: 115,
                    width: 260,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(11)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/toyota.png'),
                              width: 70,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Toyota',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
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
                            Text(
                              'General service',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '14th of Feb,2022',
                              style: TextStyle(
                                  color: Color(0xff646464),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'See Details',
                                  style: TextStyle(fontSize: 8),
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
