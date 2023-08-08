// import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/appbar.dart';
import 'package:garage_repair/Screen/Components/g_button.dart';
import 'package:garage_repair/Screen/Components/g_text_field.dart';
import 'package:garage_repair/provider/vehicle_provider.dart';
import 'package:provider/provider.dart';

import '../../bloc/bloc.dart';
import '../../service_locator.dart';
import '../g_loader.dart';
import 'policy_screen.dart';

class Insurance extends StatefulWidget {
  const Insurance({Key? key}) : super(key: key);

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  final bloc = Bloc();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VehicleProvider>(context, listen: false).vehicleClassification();
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      appBar: const GAppBar(
        screenTitle: 'Insurance',
      ),
      body: Consumer<VehicleProvider>(
        builder: (context, provider, child) {
          return Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GTextField(
                      label: 'Class of Insurance',
                      stream: bloc.insuranceClass,
                      controller: bloc.insuranceClassCtrl,
                      hintText: 'Motor Vehicle',
                      onChanged: bloc.insuranceClassOnChanged,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GTextField(
                      label: 'Cover Type',
                      stream: bloc.coverType,
                      controller: bloc.coverTypeCtrl,
                      hintText: 'Motor Vehicle',
                      onChanged: bloc.coverTypeOnChanged,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GTextField(
                        label: 'Vehicle Use',
                        stream: bloc.vehicleUse,
                        controller: bloc.vehicleUseCtrl,
                        hintText: 'Private Motor',
                        suffixIconData: Icons.arrow_drop_down_sharp,
                        isReadOnly: true,
                        onTap: () {
                          gShowModalBottomSheet(
                              context: context,
                              category: app.vehiclesUse,
                              text: '----select Vehicle Use----',
                              controller: bloc.vehicleUseCtrl);
                        }),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: GButton(
                      isValid: Stream.value(true),
                      onPressed: () {
                        provider.addInsurance(
                            context: context,
                            classOfInsurance: bloc.insuranceClassCtrl,
                          coverType: bloc.coverTypeCtrl,
                          vehicleUse: bloc.vehicleUseCtrl,
                        );
                      },
                      label: 'Proceed'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Future<dynamic> gShowModalBottomSheet(
    {required BuildContext context, required List<dynamic> category,
      required String text, required TextEditingController controller}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Consumer<VehicleProvider>(
        builder: (context, provider, child) {
          return provider.isLoading ? const GLoader() : ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20)),
              ),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.close,
                                color: Colors.white, size: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(text, textAlign: TextAlign.center, style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge),
                  for(var item in category)
                      Column(
                        children: [
                          ListTile(
                            title: Text(item ?? ''),
                            onTap: () {
                              controller.text = item;
                              Navigator.of(context).pop(false);
                            },
                          ),
                          const Divider(thickness: 2,)
                        ],
                      ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

