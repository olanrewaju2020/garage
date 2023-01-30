import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Screen/Components/g_text_field.dart';
import '../provider/vehicle_provider.dart';
import '../service_locator.dart';
import 'enum.dart';

class ShowToast {
  ShowToast({String? msg, ErrorType? type}) {
    Color backgroundColor; // = Color(0xffE23636)

    switch(type) {
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
        msg: msg ?? '', backgroundColor:  backgroundColor, textColor: Colors.white);
  }
}

Future<dynamic> showSearchableBottomSheet(
    {required BuildContext context,
      required TextEditingController controller, required Stream<String> stream}) {
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
              hintText: "Select Engineer",
              stream: stream,
            ),
            Expanded(
                child: ListView(
                    children: List.generate(
                        app.serviceVendors.length,
                            (index) => ListTile(
                          onTap: () {
                            app.vendor = app.serviceVendors[index];
                            controller.text =
                                app.serviceVendors[index].firstName ?? '';
                            Navigator.of(context).pop(app.serviceVendors[index]);
                          },
                          title: Row(
                            children: [
                              Text(
                                  "${app.serviceVendors[index].firstName}"),
                              Text(
                                  " ${app.serviceVendors[index].lastName}"),
                            ],
                          ),
                          subtitle:
                          Text("${app.serviceVendors[index].phone}"),
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
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: optionsList.length,
                    itemBuilder: (context, index) => Container(
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