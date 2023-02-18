import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/vehicle.dart';
import '../../provider/vehicle_provider.dart';

class SearchVehicle extends StatefulWidget {
  const SearchVehicle({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchVehicle> createState() => _SearchVehicleState();
}

class _SearchVehicleState extends State<SearchVehicle> {
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
                controller: fieldTextEditingController,
                focusNode: fieldFocusNode,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // color: Colors.green
                          ),
                          width: 15,
                          child: const Icon(Icons.search,
                              color: Colors.black, size: 15))),
                  border: InputBorder.none,
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Search Vehicle Identification Number(VIN)",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            });
      },
    );
  }
}
