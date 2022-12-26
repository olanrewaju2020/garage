import 'package:flutter/material.dart';
import 'package:garage_repair/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../bloc/vehicle_bloc.dart';
import '../../misc/enum.dart';
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
                hintText: 'Vehicle number',
                onChanged: bloc.vehicleNumberOnChanged,
                stream: bloc.vehicleNumber,
              ),
              const SizedBox(
                height: 22,
              ),
              GTextField(
                hintText: 'Company Name',
                onChanged: bloc.companyOnChanged,
                stream: bloc.company,
              ),
              const SizedBox(
                height: 22,
              ),
              GTextField(
                hintText: 'Registration Number',
                onChanged: bloc.regNumberOnChanged,
                stream: bloc.regNumber,
              ),
              const SizedBox(
                height: 22,
              ),
              GTextField(
                hintText: 'Color',
                onChanged: bloc.colorOnChanged,
                stream: bloc.color,
              ),
              const SizedBox(
                height: 22,
              ),
              GTextField(
                hintText: 'Model',
                onChanged: bloc.modelOnChanged,
                stream: bloc.model,
              ),
              const SizedBox(
                height: 22,
              ),
              GTextField(
                hintText: 'image',
                onChanged: bloc.imageOnChanged,
                stream: bloc.image,
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Consumer<VehicleProvider>(
                    builder: (context, provider, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
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
