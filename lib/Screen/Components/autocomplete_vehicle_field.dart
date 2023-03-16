import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/vehicle.dart';
import '../../provider/vehicle_provider.dart';

class AutoCompleteVehicleField extends StatefulWidget {
  const AutoCompleteVehicleField({
    Key? key,
  }) : super(key: key);

  @override
  State<AutoCompleteVehicleField> createState() => _AutoCompleteVehicleFieldState();
}

class _AutoCompleteVehicleFieldState extends State<AutoCompleteVehicleField> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VehicleProvider>(context, listen: false).vehicleList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleProvider>(
      builder: (context, provider, child) {
        return Autocomplete<Vehicle>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<Vehicle>.empty();
              }
              return provider.vehicles.where((vehicle) =>
              vehicle.vehicleNumber
                  ?.toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()) ??
                  false);
            },
            displayStringForOption: (Vehicle option) =>
            option.vehicleNumber ?? '',
            onSelected: (Vehicle vehicle) {
              provider.vehicle = vehicle;
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                VoidCallback onFieldSubmitted) {
              return TextField(
                autofocus: false,
                controller: fieldTextEditingController,
                focusNode: fieldFocusNode,
                style: const TextStyle(fontSize: 12.0, height: 2.1, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "--------------------------------------",
                  // errorText: snapshot.hasError ? '${snapshot.error}' : null,
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 0.58),
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),

                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffDCDCDC)),
                    borderRadius: BorderRadius.circular(25.0),
                  ),

                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              );
            });
      },
    );
  }
}