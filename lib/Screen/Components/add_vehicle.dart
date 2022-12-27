import 'package:flutter/material.dart';
import 'package:garage_repair/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../bloc/vehicle_bloc.dart';
import '../../provider/vehicle_provider.dart';
import '../onboarding/create_account.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final bloc = VehicleBloc();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context).user;
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
        title: const Text(
          'Add Vehicle',
          style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal),
        ),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              GTextField(
                hintText: 'Vehicle Identification Number',
                onChanged: bloc.vehicleNumberOnChanged,
                stream: bloc.vehicleNumber,
                  suffixIconData: Icons.search
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .65,
                  child: ListView(
                    children: [
                      const VehicleData(
                        title: 'AB and Sons',
                        subtitle: "Owner's Name"
                      ),
                      const VehicleData(
                          title: 'AJ 111 AAA',
                          subtitle: 'Registration Number:'
                      ),
                      const VehicleData(
                          title: 'Silver',
                          subtitle:'Vehicle Color'
                      ),
                      const VehicleData(
                          title: 'Camry',
                          subtitle:'Model'
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  const [
                          Expanded(child: VehicleData(
                              title: 'Toyota',
                              subtitle:'Vehicle Maker'
                          )),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/images/camry.jpeg'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Consumer<VehicleProvider>(
                    builder: (context, provider, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () async {
                          provider.vehicleStore(
                              context: context,
                              vehicleNumber: await bloc.vehicleNumber.first,
                              company: await bloc.company.first,
                              color: await bloc.color.first,
                              model: await bloc.model.first,
                              image: await bloc.image.first,
                              ownerId: await auth.uuid.first
                          );

                        },
                        child: provider.status ?
                        const Center(child: CircularProgressIndicator())
                            : const Text(
                          'Add vehicle',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VehicleData extends StatelessWidget {
  const VehicleData({
    Key? key, required this.title, required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        subtitle: Text(subtitle),
        title: Text(title)
      ),
    );
  }
}
