import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/autocomplete_vehicle_field.dart';
import 'package:garage_repair/bloc/vehicle_bloc.dart';
import 'package:garage_repair/provider/vehicle_provider.dart';
import 'package:provider/provider.dart';

import '../../g_text_field_two.dart';

class AddNewVehicleScreen extends StatefulWidget {
  const AddNewVehicleScreen({Key? key}) : super(key: key);

  @override
  State<AddNewVehicleScreen> createState() => _AddNewVehicleScreenState();
}

class _AddNewVehicleScreenState extends State<AddNewVehicleScreen> {
  final bloc = VehicleBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          'Add New Vehicle',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffEBEBEB),
      ),
      body: Consumer<VehicleProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 18.0, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vehicle Type',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Stack(
                    alignment: const Alignment(0, 0),
                    children: <Widget>[
                      GTextFieldTwo(
                        hintText: '- - - - - - - - - - - - - - - - - - -',
                        stream: bloc.vehicleType,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Vehicle Identification Number',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const AutoCompleteVehicleField(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            provider.vehicleStore(
                                vehicleNumber: provider.vehicle?.vehicleNumber ?? '',
                                company: provider.vehicle?.company ?? '',
                                color: provider.vehicle?.color ?? '',
                                model: provider.vehicle?.color ?? '',
                                image: provider.vehicle?.image ?? '',
                                ownerId: provider.vehicle?.userUuid ?? '',
                                context: context);
                          },
                          child: const Text('Add',
                            style:
                            TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
