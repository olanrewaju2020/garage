import 'package:flutter/material.dart';

class VehicleServicingNew extends StatefulWidget {
  const VehicleServicingNew({Key? key}) : super(key: key);

  @override
  State<VehicleServicingNew> createState() => _VehicleServicingNewState();
}

class _VehicleServicingNewState extends State<VehicleServicingNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          'Vehicle Servicing ',
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                child: Image(
                  image: AssetImage('assets/images/box2.png'),
                  width: 150,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/cal.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15),
                    child: Text(
                      'Book a nearby mechanic',
                      style: TextStyle(
                          color: Color(0xff646464),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff7E808A),
                      size: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/message.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15),
                    child: Text(
                      'Chat with Mechanic',
                      style: TextStyle(
                          color: Color(0xff646464),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff7E808A),
                      size: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/calls.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15),
                    child: Text(
                      'Call Mechanic ',
                      style: TextStyle(
                          color: Color(0xff646464),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff7E808A),
                      size: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
