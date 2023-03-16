import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/g_button.dart';
import 'package:garage_repair/Screen/g_loader.dart';
import 'package:provider/provider.dart';

import '../../bloc/auth_bloc.dart';
import '../../misc/enum.dart';
import '../../provider/auth_provider.dart';
import '../Components/g_text_field.dart';
import '../../misc/utils.dart';
import 'login.dart';

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

  List<String> serviceTypes = ["Repair", "Tolling", "Maintenance", "Others"];
  List<String> categories = ["Toyota", "Honda", "Nissan", "BMW"];
  List<String> socials = ["Facebook", "Twitter", "Instagram", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const GLoader() : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const Image(
                            image: AssetImage('assets/images/logo.png'),
                            width: 150,
                          ),

                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'Sign up',
                            style: TextStyle(
                                color: Color(0xff757676),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                          ),
                          const SizedBox(
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
                            child: const Text.rich(TextSpan(
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

                          const SizedBox(
                            height: 40,
                          ),
                          GTextField(
                              label: 'First Name',
                              prefixIconData: Icons.person,
                              stream: _authBloc.firstName,
                              controller: _firstNameCtrl,
                              onChanged: _authBloc.firstNameOnChange,
                              hintText: 'First Name'),
                          const SizedBox(
                            height: 20,
                          ),
                          GTextField(
                              label: 'Last Name',
                              prefixIconData: Icons.person,
                              stream: _authBloc.lastName,
                              controller: _lastNameCtrl,
                              onChanged: _authBloc.lastNameOnChange,
                              hintText: 'Last Name'),

                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GTextField(
                              label: 'Email Address',
                              prefixIconData: Icons.email,
                              stream: _authBloc.email,
                              onChanged: _authBloc.emailOnChange,
                              controller: _emailCtrl,
                              hintText: 'Email address'),

                          const SizedBox(
                            height: 20,
                          ),
                          GTextField(
                              label: 'Phone Number',
                              prefixIconData: Icons.phone,
                              stream: _authBloc.phone,
                              onChanged: _authBloc.phoneOnChange,
                              controller: _phoneCtrl,
                              hintText: 'Phone Number'),

                          const SizedBox(
                            height: 20,
                          ),
                          GTextField(
                              label: 'Password',
                              prefixIconData: Icons.lock,
                              isSecret: true,
                              stream: _authBloc.password,
                              onChanged: _authBloc.passwordOnChange,
                              controller: _passwordCtrl,
                              suffixIconData: Icons.visibility,
                              hintText: 'Password'),

                          const SizedBox(
                            height: 20,
                          ),
                          GTextField(
                              label: 'Confirm Password',
                              prefixIconData: Icons.lock,
                              isSecret: true,
                              stream: _authBloc.password,
                              controller: _confirmPasswordCtrl,
                              hintText: 'Confirm Password'),
                          const SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: GButton(
                                isValid: _authBloc.isCreateAccountValid2,
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
                                      serviceType:
                                          _authBloc.serviceTypeCtrl.text,
                                    )
                                        .then((isSuccessful) {
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
                                                    const Login()));
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             CodeActivation()));
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
