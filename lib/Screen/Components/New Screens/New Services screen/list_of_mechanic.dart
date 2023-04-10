import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:garage_repair/Models/user.dart';
import 'package:garage_repair/provider/vehicle_provider.dart';
import 'package:provider/provider.dart';

import '../../../../misc/enum.dart';
import '../../../../service_locator.dart';

class ListOfMechanic extends StatefulWidget {
  final ChatType chatType;
  final ServiceType serviceType;
  const ListOfMechanic({Key? key, this.chatType = ChatType.chat, required this.serviceType,}) : super(key: key);

  @override
  State<ListOfMechanic> createState() => _ListOfMechanicState();
}

class _ListOfMechanicState extends State<ListOfMechanic> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VehicleProvider>(context, listen: false).serviceCompanies(ServiceTypeString(widget.serviceType));
    });
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
        title: const Text(
          'Available Mechanics',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffEBEBEB),
      ),
      body: SingleChildScrollView(
        child: Consumer<VehicleProvider >(
  builder: (context, provider, child) {
  return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  app.serviceVendors.length, (index) => MechanicExperienceCard(
                    mechanic: app.serviceVendors[index], route: )),
            ),
          ),
        );
  },
),
      ),
    );
  }
}

class MechanicExperienceCard extends StatelessWidget {
  final User? mechanic;
  const MechanicExperienceCard({
    super.key, required this.mechanic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xff21B24B),
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage('assets/images/person1.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mechanic?.fullName ?? '',
                  style: const TextStyle(
                      color: Color(0xff0D0221),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 3),
                const Text(
                  '5 years experience',
                  style: TextStyle(
                      color: Color(0xff282828),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 20.0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  //print(rating);
                },
              )),
        ],
      ),
    );
  }
}
