import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/vehicle_bloc.dart';
import '../../provider/vehicle_provider.dart';
import 'g_button.dart';
import 'search_vehicle.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final bloc = VehicleBloc();

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
        elevation: 0.1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Consumer<VehicleProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const SearchVehicle(),
                    if(provider.vehicle != null)
                    Consumer<VehicleProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          children: [
                            VehicleData(
                                title: provider.vehicle?.company ?? "", subtitle: "Owner's Name"),
                            VehicleData(
                                title: provider.vehicle?.regNumber ?? "",
                                subtitle: 'Registration Number:'),
                            VehicleData(
                                title: provider.vehicle?.color ?? "", subtitle: 'Vehicle Color'),
                            VehicleData(
                                title: provider.vehicle?.model ?? "", subtitle: 'Model'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Expanded(
                                    child: VehicleData(
                                        title: 'Toyota',
                                        subtitle: 'Vehicle Maker')),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16.0),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                    AssetImage('assets/images/camry.jpeg'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: Consumer<VehicleProvider>(
                                builder: (context, provider, child) {
                                  return GButton(
                                    isValid: Stream.value(provider.vehicle == null ? false : true),
                                    isLoading: provider.isLoading,
                                    label: 'Add Vehicle',
                                    onPressed: () async {
                                      provider.vehicleStore(
                                          vehicleNumber: provider.vehicle?.regNumber ?? '',
                                          company: provider.vehicle?.company ?? '',
                                          color: provider.vehicle?.color ?? '',
                                          model: provider.vehicle?.model ?? '',
                                          image: 'image picture need to come from backend',
                                          ownerId: "owner",
                                          context: context);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}



class VehicleData extends StatelessWidget {
  const VehicleData({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(subtitle: Text(subtitle), title: Text(title)),
    );
  }
}
