import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/New%20Screens/New%20Services%20screen/search_new.dart';

import '../../../../misc/enum.dart';

class NewVehicleInspection extends StatefulWidget {
  const NewVehicleInspection({Key? key}) : super(key: key);

  @override
  State<NewVehicleInspection> createState() => _NewVehicleInspectionState();
}

class _NewVehicleInspectionState extends State<NewVehicleInspection> {
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
          'Vehicle Inspection',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/box4.png'),
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BookAppointment(serviceType: ServiceType.none,),
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
                    child: Text('Chat with Mechanic', style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),),
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
              ),
              const SizedBox(
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
                    child: Text('Call Mechanic ', style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),),
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

class BookAppointment extends StatelessWidget {
  final ServiceType serviceType;

  const BookAppointment({
    super.key, required this.serviceType
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchMechanic(serviceType: "inspection"))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Image(
            image: AssetImage('assets/images/cal.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 15),
            child: Text('Book an appointment', style: TextStyle(
              color: Color(0xff646464),
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),),
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
      ),
    );
  }
}
