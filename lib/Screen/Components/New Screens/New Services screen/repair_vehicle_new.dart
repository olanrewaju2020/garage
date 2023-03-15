import 'package:flutter/material.dart';

class RepairVehicleNew extends StatefulWidget {
  final bool canBookMechanic;
  const RepairVehicleNew({Key? key,  this.canBookMechanic = false}) : super(key: key);

  @override
  State<RepairVehicleNew> createState() => _RepairVehicleNewState();
}

class _RepairVehicleNewState extends State<RepairVehicleNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          'Repair Vehicle',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffEBEBEB),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const SizedBox(
                height: 25,
              ),
               const Center(
                child: Image(
                  image: AssetImage('assets/images/box1.png'),
                  width: 150,
                ),
              ),
               const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Image(
                    image: AssetImage('assets/images/cal.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15),
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
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Image(
                    image: AssetImage('assets/images/message.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15),
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
                children: const [
                  Image(
                    image: AssetImage('assets/images/calls.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15),
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
                    padding: EdgeInsets.only(top: 18.0),
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
