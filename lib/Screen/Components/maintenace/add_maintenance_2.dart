import 'package:flutter/material.dart';
import 'package:garage_repair/provider/vehicle_provider.dart';
import 'package:provider/provider.dart';
import '../../../Models/vehicle_service.dart';
import '../../../bloc/vehicle_bloc.dart';
import '../../../misc/utils.dart';
import '../../../service_locator.dart';
import '../g_button.dart';
import '../g_text_field.dart';

class AddMaintenance2 extends StatefulWidget {
  final String serviceType;
  const AddMaintenance2({Key? key, required this.serviceType})
      : super(key: key);

  @override
  State<AddMaintenance2> createState() => _AddMaintenance2State();
}

class _AddMaintenance2State extends State<AddMaintenance2> {
  final bloc = VehicleBloc();
  final searchTermCtrl = TextEditingController();
  List<String> serviceTypes = ["Repair", "Tolling", "Maintenance", "Others"];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<VehicleProvider>(context, listen: false);
      provider.serviceCompanies(widget.serviceType);
      provider.serviceCompanies(app.serviceType ?? '');
      provider.vehiclesOwnList(ownerId: app.user.uuid ?? '');
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
          title: const Text(
            'Request Service',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal),
          ),
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Colors.white,
        ),
        body: Consumer<VehicleProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GTextField(
                      hintText: "Select Engineer",
                      stream: bloc.mechanicsName,
                      controller: searchTermCtrl,
                      isReadOnly: true,
                      onTap: () async {
                        final mechanic = await showSearchableBottomSheet(
                            stream: bloc.mechanicsName,
                            context: context,
                            controller: searchTermCtrl);
                        provider.setVendor(mechanic);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GTextField(
                      stream: Stream.value(app.vendor.address ?? ''),
                      isReadOnly: true,
                      hintText: app.vendor.address ?? 'Address',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GTextField(
                      stream: Stream.value(app.vendor.phone ?? ''),
                      isReadOnly: true,
                      hintText: app.vendor.phone ?? 'Phone number',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GTextField(
                        hintText: 'Maintenance Category',
                        stream: bloc.serviceType,
                        isReadOnly: true,
                        controller: bloc.serviceTypeCtrl,
                        onTap: () {
                          showBottomSheetDDown(
                            context: context,
                            controller: bloc.serviceTypeCtrl,
                            optionsList: serviceTypes,
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    GTextField(
                        hintText: 'Select Vehicle',
                        stream: bloc.regNumber,
                        isReadOnly: true,
                        controller: bloc.vehicleCtrl,
                        onTap: () {
                          showVehicleOwnBottomSheetDDown(
                            context: context,
                            controller: bloc.vehicleCtrl,
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    GTextField(
                        hintText: 'Service Description',
                        stream: bloc.serviceDescription,
                        controller: bloc.complainCtrl,
                       ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: GButton(
                        onPressed: () {
                          provider.requestNewService(
                            context: context,
                            request: VehicleService(
                                serviceProviderUuid: app.vendor.uuid ?? '',
                                serviceOwnerUuid: app.user.uuid ?? '',
                                vehicleUuid: app.vehicleSelected.uuid ?? '',
                                serviceType: bloc.serviceTypeCtrl.text,
                                ownerComplain: bloc.complainCtrl.text
                            )
                          );
                        },
                        isLoading: provider.isLoading,
                        isValid: Stream.value(true),
                        label: 'Add maintenance',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
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
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: app.vehiclesOwn.length,
                    itemBuilder: (context, index) => Container(
                        child: ListTile(
                            onTap: () {
                              final bloc = VehicleBloc();
                              bloc.regNumberOnChanged(app.vehiclesOwn[index].regNumber ?? '');
                              controller.text =
                                  app.vehiclesOwn[index].regNumber ?? '';
                              app.vehicleSelected = app.vehiclesOwn[index];

                              Navigator.of(context).pop();
                            },
                            title: Text(
                                app.vehiclesOwn[index].regNumber ?? '')))),
              )
            ]));
      });
}
