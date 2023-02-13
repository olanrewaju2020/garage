import 'package:flutter/material.dart';
import 'package:garage_repair/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../service_locator.dart';
import '../Components/g_button.dart';
import '../Components/g_text_field.dart';
import '../Components/g_text_field_two.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final bloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEBEBEB),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: 32,
            ),
          ),
          title: const Text(
            'Profile ',
            style: TextStyle(
                color: Color(0xff21B24B),
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal),
          ),
          elevation: 0,
          backgroundColor: const Color(0xffEBEBEB),
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: (
                  SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Center(
                                  child: Text( 'Tap Image to update Photo',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffAAAAAA)),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Center(
                                  child: Image.asset(
                                    'assets/images/avata.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              app.user.fullName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  letterSpacing: 0.4,
                                  color: Color(0xff21B24B)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff646464)),
                          ),
                          Text(
                            app.user.email ?? '',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffAAAAAA)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff646464)),
                          ),
                          Text(
                            app.user.phone ?? '',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffAAAAAA)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'City/Region ',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Stack(
                            alignment: const Alignment(0, 0),
                            children: <Widget>[
                              GTextFieldTwo(
                                hintText: '- - - - - - - - - - - - - - - - - - -',
                                stream: bloc.city,
                                onChanged: bloc.cityOnChange,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Address 1(Home)',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Stack(
                            alignment: const Alignment(0, 0),
                            children: <Widget>[
                              GTextFieldTwo(
                                stream: bloc.homeAddress,
                                onChanged: bloc.homeAddressOnChange,
                                hintText: '- - - - - - - - - - - - - - - - - - -',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Address 1(Work)',
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Stack(
                            alignment: const Alignment(0, 0),
                            children: <Widget>[
                              GTextFieldTwo(
                                stream: bloc.city,
                                onChanged: bloc.workAddressOnChange,
                                hintText: '- - - - - - - - - - - - - - - - - - -',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: GButton(
                              isValid: bloc.isProfileUpdateValid,
                              label: 'Save',
                              onPressed: () async {
                                provider.updateUserAddress(
                                    city: await bloc.city.first,
                                    homeAddress: await bloc.homeAddress.first,
                                    workAddress: await bloc.workAddress.first,
                                );
                              },
                            ),
                          )
                        ],
                      ))),
            );
          },
        ));
  }
}
