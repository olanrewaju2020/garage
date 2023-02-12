import 'package:flutter/material.dart';

import 'add_new_vehicle_screen.dart';
import 'list_of_registered_vehicle.dart';
import 'new_register_vehicle_screen.dart';

class NewVehicleScreen extends StatefulWidget {
  const NewVehicleScreen({Key? key}) : super(key: key);

  @override
  State<NewVehicleScreen> createState() => _NewVehicleScreenState();
}

class _NewVehicleScreenState extends State<NewVehicleScreen> {
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
          'Vehicle',
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
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/arroww.png'),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new NewRegisterVehicleScreen()));
                      },
                      child: Text(
                        'Register Vehicle',
                        style: TextStyle(
                            color: Color(0xff646464),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
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
                    image: AssetImage('assets/images/arroww.png'),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                new ListOfRegisteredVehicle()));
                      },
                      child: Text(
                        'Registered Vehicles ',
                        style: TextStyle(
                            color: Color(0xff646464),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
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
                    image: AssetImage('assets/images/arroww.png'),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                new AddNewVehicleScreen()));
                      },
                      child: Text(
                        'Add to Vehicle(s)',
                        style: TextStyle(
                            color: Color(0xff646464),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
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
