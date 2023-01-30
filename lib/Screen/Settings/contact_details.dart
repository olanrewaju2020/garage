import 'package:flutter/material.dart';
import 'package:garage_repair/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

import '../../Models/user.dart';
import '../../provider/auth_provider.dart';
import '../Components/g_button.dart';
import '../Components/g_text_field.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  final bloc = AuthBloc();

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
          'Contact Details',
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal),
        ),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text(
                      'First Name',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GTextField(
                    hintText: 'First name',
                    stream: bloc.firstName,
                    onChanged: bloc.firstNameOnChange,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text(
                      'Last Name',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GTextField(
                    hintText: 'Last name',
                    stream: bloc.lastName,
                    onChanged: bloc.lastNameOnChange,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GTextField(
                    hintText: 'Email',
                    stream: bloc.email,
                    onChanged: bloc.emailOnChange,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GTextField(
                    hintText: 'Phone number',
                    stream: bloc.phone,
                    onChanged: bloc.phoneOnChange,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: GButton(
                      isValid: bloc.contactFormValid,
                      isLoading: provider.isLoading,
                      onPressed: () async => provider.updateProfile(context: context, user: User(
                        firstName: await bloc.lastName.first,
                        lastName: await bloc.lastName.first,
                        email: await bloc.email.first,
                        phone: await bloc.phone.first,
                      )),
                      label: 'Save Changes',
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
