import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/appbar.dart';
import 'package:garage_repair/Screen/Dashboard/dashboard.dart';
import 'package:garage_repair/misc/utils.dart';
import 'package:provider/provider.dart';

import '../../bloc/bloc.dart';
import '../../provider/vehicle_provider.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      appBar: const GAppBar(screenTitle: 'Policy Details'),
      body: Consumer<VehicleProvider>(
        builder: (context, provider, child) {
          return Container(
            padding: const EdgeInsets.all(24),
            child: ListView(
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
                  label: 'NIN Holders (Optional)',
                  stream: bloc.nin,
                  controller: bloc.ninCtrl,
                  hintText: 'NIN',
                  onChanged: bloc.ninOnChanged,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                GTextField(
                  label: 'State',
                  stream: bloc.state,
                  controller: bloc.stateCtrl,
                  hintText: 'State',
                  onChanged: bloc.stateOnChanged,
                ),
                const SizedBox(
                  height: 20,
                ),
                GTextField(
                  label: 'LGA',
                  stream: bloc.lga,
                  controller: bloc.lgaCtrl,
                  hintText: 'LGA',
                  onChanged: bloc.lgaOnChanged,
                ),
                const SizedBox(
                  height: 20,
                ),
                GTextField(
                    label: 'Address',
                    stream: bloc.address,
                    controller: bloc.addressCtrl,
                    hintText: 'Address',
                    onChanged: bloc.addressOnChanged
                ),
                const SizedBox(
                  height: 20,
                ),
                GButton(
                  label: 'Proceed',
                  isValid: Stream.value(true),
                  onPressed: () {
                    showSuccess(context: context, route: Dashboard());
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
