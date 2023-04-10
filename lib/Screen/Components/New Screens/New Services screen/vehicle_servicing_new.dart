import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/New%20Screens/New%20Services%20screen/vehicle_inspection_new.dart';

import '../../../../misc/enum.dart';
import 'book_appointment.dart';

class VehicleServicingNew extends StatefulWidget {
  final String imageUrl;
  final String title;
  final ServiceType serviceType;
  const VehicleServicingNew({Key? key, required this.imageUrl, required this.title, required this.serviceType}) : super(key: key);

  @override
  State<VehicleServicingNew> createState() => _VehicleServicingNewState();
}

class _VehicleServicingNewState extends State<VehicleServicingNew> {


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { });

    super.initState();
  }

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
        title: Text(
          widget.title,
          style: const TextStyle(
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
              Center(
                child: Image(
                  image: AssetImage(widget.imageUrl),
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BookAppointment(serviceType: widget.serviceType,),
              const SizedBox(
                height: 25,
              ),
              ChatWithMechanic(chatType: ChatType.chat, serviceType: widget.serviceType,),
              const SizedBox(
                height: 25,
              ),
             const CallMechanic()
            ],
          ),
        ),
      ),
    );
  }
}

class CallMechanic extends StatelessWidget {
  const CallMechanic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

