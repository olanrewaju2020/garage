import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/appbar.dart';
import 'package:garage_repair/Screen/Dashboard/dashboard.dart';
import 'package:garage_repair/misc/utils.dart';

import '../../bloc/bloc.dart';
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
      body: Container(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            GTextField(
              label: 'Policy Holder',
              stream: bloc.policyHolder,
              controller: bloc.policyHolderCtrl,
              hintText: 'Policy Holder',
            ),
            const SizedBox(
              height: 20,
            ),
            GTextField(
              label: 'Company Name',
              stream: bloc.companyName,
              controller: bloc.companyNameCtrl,
              hintText: 'Company Name',
            ),
            const SizedBox(
              height: 20,
            ),
            GTextField(
              label: 'NIN Holders (Optional)',
              stream: bloc.nin,
              controller: bloc.ninCtrl,
              hintText: 'NIN',
            ),
            const SizedBox(
              height: 20,
            ),
            GTextField(
              label: 'NIN Holders (Optional)',
              stream: bloc.nin,
              controller: bloc.ninCtrl,
              hintText: 'NIN',
            ),
            const SizedBox(
              height: 20,
            ),
            GTextField(
              label: 'Issues Date',
              stream: bloc.nin,
              controller: bloc.ninCtrl,
              hintText: 'Select Date',
            ),
            const SizedBox(
              height: 20,
            ),
            GTextField(
              label: 'State',
              stream: bloc.nin,
              controller: bloc.ninCtrl,
              hintText: 'State',
            ),
            const SizedBox(
              height: 20,
            ),
            GTextField(
              label: 'LGA',
              stream: bloc.nin,
              controller: bloc.ninCtrl,
              hintText: 'LGA',
            ),
            const SizedBox(
              height: 20,
            ),
            GTextField(
              label: 'Address',
              stream: bloc.nin,
              controller: bloc.ninCtrl,
              hintText: 'Address',
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
      ),
    );
  }
}
