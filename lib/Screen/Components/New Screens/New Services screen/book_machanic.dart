import 'package:flutter/material.dart';

class BookMechanic extends StatefulWidget {
  const BookMechanic({Key? key}) : super(key: key);

  @override
  State<BookMechanic> createState() => _BookMechanicState();
}

class _BookMechanicState extends State<BookMechanic> {
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
          'Mechanic’Profile',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 22,
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
              Center(
                child: Image(
                  image: AssetImage('assets/images/hatt.png'),
                  width: 150,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Center(
                child: Text(
                  'Shola Fatoki',
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff282828),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Center(
                child: Text(
                  'Somorin',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff282828),
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/circle.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      'Open to work',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff282828),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'A1E36Y2',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff282828),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'REG NO',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff646464),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '6 Years',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff282828),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'EXP',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff646464),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '4.9',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff282828),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'RATING',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff646464),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reviews',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff282828),
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff21B24B),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
