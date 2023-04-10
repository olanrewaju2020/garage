import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Screen/Components/g_button.dart';
import '../Screen/Components/g_text_field.dart';
import '../bloc/vehicle_bloc.dart';
import '../provider/vehicle_provider.dart';
import '../service_locator.dart';
import 'enum.dart';

class ShowToast {
  ShowToast({String? msg, ErrorType? type}) {
    Color backgroundColor; // = Color(0xffE23636)

    switch (type) {
      case ErrorType.error:
        backgroundColor = const Color(0xffE23636);
        break;
      case ErrorType.warning:
        backgroundColor = const Color(0xffEDB95E);
        break;
      case ErrorType.info:
        backgroundColor = const Color(0xff95fdf9);
        break;
      default:
        backgroundColor = const Color(0xff82DD55);
    }

    Fluttertoast.showToast(
        fontSize: 20,
        toastLength: Toast.LENGTH_LONG,
        msg: msg ?? '',
        backgroundColor: backgroundColor,
        textColor: Colors.white);
  }
}

Future<dynamic> showSearchableBottomSheet(
    {required BuildContext context,
    required TextEditingController controller,
    required Stream<String> stream}) {
  return showModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (context) {
        return Consumer<VehicleProvider>(
          builder: (context, provider, child) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(children: [
                GTextField(
                  label: 'Select Engineer',
                  hintText: "Select Engineer",
                  stream: stream,
                ),
                Expanded(
                    child: ListView(
                        children: List.generate(
                            app.serviceVendors.length,
                            (index) => Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.greenAccent,
                                        offset: Offset(
                                          2.0,
                                          2.0,
                                        ),
                                        blurRadius: 2.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      app.vendor = app.serviceVendors[index];
                                      controller.text =
                                          app.serviceVendors[index].firstName ??
                                              '';
                                      Navigator.of(context)
                                          .pop(app.serviceVendors[index]);
                                    },
                                    title: Row(
                                      children: [
                                        const Icon(Icons.person),
                                        const SizedBox(width: 10),
                                        Text(
                                            "${app.serviceVendors[index].firstName}", style: Theme.of(context).textTheme.titleLarge),
                                        Text(
                                            " ${app.serviceVendors[index].lastName}", style: Theme.of(context).textTheme.titleLarge),
                                      ],
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on),
                                            const SizedBox(width: 10),
                                            Text(
                                                "${app.serviceVendors[index].address}"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.phone),
                                            const SizedBox(width: 10),
                                            Text(
                                                "${app.serviceVendors[index].phone}"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing: Text(app.serviceVendors[index].serviceType ?? ''),
                                  ),
                                ))))
              ]),
            );
          },
        );
      });
}

Future<dynamic> showBottomSheetDDown(
    {required BuildContext context,
    required TextEditingController controller,
    required List<String> optionsList,
    Function? onSelect}) {
  return showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
            height: 400,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: optionsList.length,
                    itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                            onTap: () {
                              controller.text = optionsList[index];
                              onSelect == null ? null : onSelect();
                              Navigator.of(context).pop();
                            },
                            title: Text(optionsList[index])))),
              )
            ]));
      });
}


Future<dynamic> showVehicleOwnBottomSheetDDown(
    {required BuildContext context,
      required TextEditingController controller}) {
  return showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: app.vehiclesOwn.length,
                    itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: ListTile(
                            onTap: () {
                              final bloc = VehicleBloc();
                              bloc.regNumberOnChanged(app.vehiclesOwn[index].regNumber ?? '');
                              controller.text =
                                  app.vehiclesOwn[index].regNumber ?? '';
                              app.vehicleSelected = app.vehiclesOwn[index];

                              Navigator.of(context).pop();
                            },
                            leading:  const CircleAvatar(
                              radius: 40,
                              backgroundImage:
                              AssetImage('assets/images/camry.jpeg'),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    app.vehiclesOwn[index].regNumber ?? '', style: Theme.of(context).textTheme.titleLarge),
                                Text(
                                    app.vehiclesOwn[index].model ?? ''),
                                Text(
                                    app.vehiclesOwn[index].color ?? '')
                              ],
                            )))),
              )
            ]));
      });
}

Future<dynamic> showSuccess(
    {required BuildContext context, String message = 'Request sent successfully', required Widget route}) {
  return showDialog(context: context, builder: (context) {
    return Dialog(
        child: ClipRect(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(false),
                        child: const Icon(Icons.close, color: Colors.white,))
                  ],
                ),
                const SizedBox(height: 100,),
                Text(message, style:
                const TextStyle(color: Colors.white, fontSize: 18),),
                const SizedBox(height: 50,),
                SizedBox(
                  width: 100,
                  child: GButton(
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    isValid: Stream.value(true),
                    label: 'Okay',
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => route), (route) => false);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  });
}
