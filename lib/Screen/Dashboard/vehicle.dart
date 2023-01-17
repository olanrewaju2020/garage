import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/g_loader.dart';
import 'package:provider/provider.dart';
import '../../Models/vehicle.dart';
import '../../provider/vehicle_provider.dart';
import '../../service_locator.dart';
import '../Components/add_vehicle.dart';
import '../Components/details/car_details.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<VehicleProvider>(context, listen: false);
      if (provider.vehiclesOwn.isEmpty) {
        provider.vehiclesOwnList(ownerId: app.user?.uuid ?? "");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
            size: 15,
          ),
        ),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
      ),
      body: Consumer<VehicleProvider>(
        builder: (context, provider, child) {
          return provider.isLoading ? const GLoader() : ListOfVehicles(route: CarDetails());
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddVehicle(),
          ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ListOfVehicles extends StatelessWidget {
  final Widget route;
  const ListOfVehicles({
    Key? key, required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(app.vehiclesOwn.length, (index){
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (
                          context) => route));
                },
                child: VehicleDetails(vehicle: app.vehiclesOwn[index],),
              );
            }),
         ),
      ),
    );
  }
}

class VehicleDetails extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleDetails({
    Key? key, required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      'assets/images/Redcar.png',
                      width: 120,
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    const Text(
                      'Available',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          fontStyle: FontStyle.normal,
                          color: Colors.green),
                    )
                  ],
                )),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${vehicle.company}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${vehicle.regNumber}',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${vehicle.company}',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${vehicle.vehicleNumber}',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${vehicle.color}',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500]),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
