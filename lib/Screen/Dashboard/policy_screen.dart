import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/appbar.dart';
import 'package:garage_repair/Screen/g_loader.dart';
import 'package:garage_repair/misc/utils.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../bloc/bloc.dart';
import '../../provider/vehicle_provider.dart';
import '../../service_locator.dart';
import '../Components/g_button.dart';
import '../Components/g_text_field.dart';

class PolicyDetails extends StatefulWidget {
  const PolicyDetails({super.key});

  @override
  State<PolicyDetails> createState() => _PolicyDetailsState();
}

class _PolicyDetailsState extends State<PolicyDetails> {
  final bloc = Bloc();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (app.vehiclesOwn.isEmpty) {
        await Provider.of<VehicleProvider>(context, listen: false)
            .vehiclesOwnList(ownerId: app.user.uuid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      appBar: const GAppBar(screenTitle: 'Policy Details'),
      body: Consumer<VehicleProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const GLoader()
              : Container(
                  padding: const EdgeInsets.all(24),
                  child: app.vehiclesOwn.isEmpty
                      ? Container()
                      : ListView(
                          children: [
                            GTextField(
                              label: 'Policy Holder',
                              stream: bloc.policyHolder,
                              controller: bloc.policyHolderCtrl,
                              hintText: 'Policy Holder',
                              onChanged: bloc.policyHolderOnChanged,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GTextField(
                              label: 'Company Name',
                              stream: bloc.companyName,
                              controller: bloc.companyNameCtrl,
                              hintText: 'Company Name',
                              onChanged: bloc.companyNameOnChanged,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GTextField(
                              label: 'Vehicle',
                              stream: bloc.vehicleUse,
                              controller: bloc.vehicleUseCtrl,
                              hintText: 'Select a vehicle',
                              isReadOnly: true,
                              suffixIconData: Icons.arrow_drop_down_sharp,
                              onChanged: bloc.vehicleUseOnChanged,
                              onTap: () async {
                                List<String> optionsList = app.vehiclesOwn
                                    .map((vehicle) =>
                                        '${vehicle.company} ${vehicle.regNumber}')
                                    .toList();
                                final result = await showBottomSheetDDown(
                                    context: context,
                                    controller: bloc.vehicleUseCtrl,
                                    optionsList: optionsList);
                                bloc.vehicleUseOnChanged(bloc.vehicleUseCtrl.text);
                                if (result != null) {
                                  final queryList = bloc.vehicleUseCtrl.text.split(' ');
                                  String getQuery = queryList[queryList.length - 1];
                                  app.vehicleSelected = app.vehiclesOwn.where((vehicle) => vehicle.regNumber?.contains(getQuery) ?? false).first;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GTextField(
                              label: 'NIN Holders (Optional)',
                              stream: bloc.nin,
                              controller: bloc.ninCtrl,
                              hintText: 'NIN',
                              onChanged: bloc.ninOnChanged,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GTextField(
                                label: 'Issue Date',
                                stream: bloc.issueDate,
                                controller: bloc.issueDateCtrl,
                                isReadOnly: true,
                                hintText: 'Issue Date',
                                onChanged: bloc.issueDateOnChanged,
                                onTap: () async {
                                  final selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(3000));
                                  if (selectedDate != null) {
                                    final formattedDate =
                                        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                                    bloc.issueDateCtrl.text = formattedDate;
                                    bloc.issueDateOnChanged(
                                        bloc.issueDateCtrl.text);
                                  }
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            GButton(
                              label: 'Proceed',
                              isValid: bloc.isPolicyDataValid,
                              onPressed: () {
                                provider.addPolicy(
                                  context: context,
                                  policyHolder: bloc.policyHolderCtrl,
                                  companyName: bloc.companyNameCtrl,
                                  nin: bloc.ninCtrl,
                                  policyDate: bloc.policyHolderCtrl,
                                );
                              },
                            ),
                          ],
                        ),
                );
        },
      ),
    );
  }
}
