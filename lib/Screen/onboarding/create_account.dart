import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/g_button.dart';
import 'package:garage_repair/Screen/g_loader.dart';
import 'package:garage_repair/Screen/onboarding/login.dart';
import 'package:provider/provider.dart';

import '../../bloc/auth_bloc.dart';
import '../../provider/auth_provider.dart';
import '../Components/g_drop_down.dart';
import '../Components/g_text_field.dart';
import '../misc/enum.dart';
import '../misc/utils.dart';
import 'code_activation.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _authBloc = AuthBloc();
  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmPasswordCtrl = TextEditingController();
  final TextEditingController _aboutUsCtrl = TextEditingController();

  List<String> serviceTypes = [  "Repair", "Tolling", "Maintenance", "Others"];
  List<String> categories = [  "Toyota", "Honda", "Nissan", "BMW"];
  List<String> socials = [ "Facebook", "Twitter", "Instagram", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const GLoader()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: 60,
                          ),
                          Image(
                              image: AssetImage('assets/images/logo.png'),
                              width: 150,
                            ),

                          const SizedBox(
                            height: 25,
                          ),


                            Text('Sign up', style: TextStyle(
                                color: Color(0xff757676),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 25
                            ),),

                          SizedBox(
                            height: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const CreateAccount()));
                            },
                              child: Text.rich(TextSpan(
                                text: "Already have an account ?",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6A6F73)),
                                children: [
                                  TextSpan(
                                    text: " Log in",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green),
                                  ),
                                ],
                              )),

                          ),

                          SizedBox(
                            height: 40,
                          ),

                          Text('Name', style: TextStyle(
                              color: Color(0xff646464),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          GTextField(
                              stream: _authBloc.firstName,
                              controller: _firstNameCtrl,
                              onChanged: _authBloc.firstNameOnChange,
                              hintText: 'First name'),

SizedBox(
  height: 20,
),
                          Text('Email', style: TextStyle(
                              color: Color(0xff646464),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),),
                          SizedBox(
                            height: 5,
                          ),
                          GTextField(
                              stream: _authBloc.email,
                              onChanged: _authBloc.emailOnChange,
                              controller: _emailCtrl,
                              hintText: 'Email address'),


                          SizedBox(
                            height: 20,
                          ),
                          Text('Password', style: TextStyle(
                              color: Color(0xff646464),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),),
                          SizedBox(
                            height: 5,
                          ),

                          GTextField(
                              isSecret: true,
                              stream: _authBloc.password,
                              onChanged: _authBloc.passwordOnChange,
                              controller: _passwordCtrl,
                              hintText: 'Password'),


                          SizedBox(
                            height: 20,
                          ),
                          Text('Confirm Password', style: TextStyle(
                              color: Color(0xff646464),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),),
                          SizedBox(
                            height: 5,
                          ),

                          GTextField(
                              isSecret: true,
                              stream: _authBloc.password,
                              controller: _confirmPasswordCtrl,
                              hintText: 'Confirm Password'),



                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       child: GTextField(
                          //           stream: _authBloc.firstName,
                          //           controller: _firstNameCtrl,
                          //           onChanged: _authBloc.firstNameOnChange,
                          //           hintText: 'First name'),
                          //     ),
                          //     const SizedBox(width: 20),
                          //     Expanded(
                          //       child: GTextField(
                          //           stream: _authBloc.lastName,
                          //           onChanged: _authBloc.lastNameOnChange,
                          //           controller: _lastNameCtrl,
                          //           hintText: 'Last name'),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 25,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       child: GTextField(
                          //           stream: _authBloc.email,
                          //           onChanged: _authBloc.emailOnChange,
                          //           controller: _emailCtrl,
                          //           hintText: 'Email address'),
                          //     ),
                          //     const SizedBox(width: 20),
                          //     Expanded(
                          //       child: GTextField(
                          //           stream: _authBloc.phone,
                          //           controller: _phoneCtrl,
                          //           hintText: 'Phone number',
                          //           onChanged: _authBloc.phoneOnChange),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 25,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       child: GTextField(
                          //           isSecret: true,
                          //           stream: _authBloc.password,
                          //           onChanged: _authBloc.passwordOnChange,
                          //           controller: _passwordCtrl,
                          //           hintText: 'Password'),
                          //     ),
                          //     const SizedBox(width: 20),
                          //     Expanded(
                          //         child: GTextField(
                          //             isSecret: true,
                          //             stream: _authBloc.password,
                          //             controller: _confirmPasswordCtrl,
                          //             hintText: 'Confirm Password')),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 25,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       child: GDropDown(
                          //         stream: _authBloc.category,
                          //         hint: 'Select Category',
                          //         controller: _authBloc.categoryCtrl,
                          //         options: categories,
                          //         onChange: _authBloc.categoryOnChange
                          //       ),
                          //     ),
                          //     const SizedBox(width: 20),
                          //     Expanded(
                          //         child: GDropDown(
                          //       stream: _authBloc.serviceType,
                          //       hint: 'Select Service Type',
                          //       options: serviceTypes,
                          //       controller: _authBloc.serviceTypeCtrl,
                          //       onChange: _authBloc.serviceOnChange
                          //     )),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 25,
                          // ),
                          // GDropDown(
                          //     stream: _authBloc.aboutUs,
                          //     hint: 'How do you hear about us?',
                          //     options: socials,
                          //     controller: _aboutUsCtrl,
                          //     onChange: _authBloc.aboutUsOnChange
                          // ),
                          const SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: GButton(
                                isValid: _authBloc.isCreateAccountValid,
                                onPressed: () {
                                  if (_passwordCtrl.text ==
                                      _confirmPasswordCtrl.text) {
                                    provider
                                        .register(
                                            firstName: _firstNameCtrl.text,
                                            lastName: _lastNameCtrl.text,
                                            email: _emailCtrl.text,
                                            phone: _phoneCtrl.text,
                                            password: _passwordCtrl.text,
                                            aboutUs: _aboutUsCtrl.text,
                                            category: _authBloc.categoryCtrl.text,
                                            serviceType: _authBloc.serviceTypeCtrl.text,
                                    ).then((isSuccessful) {
                                      if (isSuccessful) {
                                        _emailCtrl.clear();
                                        _phoneCtrl.clear();
                                        _passwordCtrl.clear();
                                        _firstNameCtrl.clear();
                                        _lastNameCtrl.clear();
                                        _confirmPasswordCtrl.clear();
                                        _aboutUsCtrl.clear();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CodeActivation()));
                                      }
                                    });
                                  } else {
                                    ShowToast(
                                        msg: 'Password fields do not match',
                                        type: ErrorType.error);
                                  }
                                },
                                label: 'Create account',
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}

