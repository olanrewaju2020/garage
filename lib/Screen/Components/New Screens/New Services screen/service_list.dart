import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/New%20Screens/New%20Services%20screen/repair_vehicle_new.dart';
import 'package:garage_repair/Screen/Components/New%20Screens/New%20Services%20screen/rescue_new.dart';
import 'package:garage_repair/Screen/Components/New%20Screens/New%20Services%20screen/vehicle_inspection_new.dart';
import 'package:garage_repair/Screen/Components/New%20Screens/New%20Services%20screen/vehicle_servicing_new.dart';
import 'package:garage_repair/Screen/Dashboard/insurance.dart';
import 'package:garage_repair/misc/enum.dart';

class ServicesOne extends StatefulWidget {
  const ServicesOne({Key? key}) : super(key: key);

  @override
  State<ServicesOne> createState() => _ServicesOneState();
}

class _ServicesOneState extends State<ServicesOne> {
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
          'Services Offered',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffEBEBEB),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceListCard(
                  title: 'Vehicle Inspection',
                  imageUrl: 'assets/images/7s.png',
                  description:
                      'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.',
                  route: NewVehicleInspection()),
              SizedBox(
                height: 20,
              ),
              ServiceListCard(
                title: 'Vehicle Repair',
                imageUrl: 'assets/images/span.png',
                description:
                    'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.',
                route: RepairVehicleNew(),
              ),
              SizedBox(
                height: 20,
              ),
              ServiceListCard(
                title: 'Vehicle Servicing',
                imageUrl: 'assets/images/6s.png',
                description:
                    'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.',
                route: VehicleServicingNew(
                  serviceType: ServiceType.servicing,
                  title: 'Vehicle Servicing',
                  imageUrl: 'assets/images/box2.png',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ServiceListCard(
                title: 'Rescue Service',
                imageUrl: 'assets/images/tow2s.png',
                description:
                    'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.',
                route: RescusNew(),
              ),
              SizedBox(
                height: 20,
              ),
              ServiceListCard(
                title: 'Insurance',
                imageUrl: 'assets/images/tow2s.png',
                description:
                    'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.',
                route: Insurance(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceListCard extends StatelessWidget {
  final String title, imageUrl, description;
  final Widget route;

  const ServiceListCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
        height: 115,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Color(0xff646464),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                        color: Color(0xff7E808A),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xff7E808A),
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
