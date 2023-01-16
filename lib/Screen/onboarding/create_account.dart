import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/g_button.dart';
import 'package:garage_repair/Screen/g_loader.dart';
import 'package:garage_repair/Screen/onboarding/login.dart';
import 'package:provider/provider.dart';

import '../../bloc/auth_bloc.dart';
import '../../provider/auth_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      body: Consumer<AuthProvider>(
  builder: (context, provider, child) {
  return provider.isLoading ? const GLoader() : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 150,
                  height: 150,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GTextField(
                        stream: _authBloc.firstName,
                        controller: _firstNameCtrl,
                        onChanged: _authBloc.firstNameOnChange,
                        hintText: 'First name'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GTextField(
                        stream: _authBloc.lastName,
                        onChanged: _authBloc.lastNameOnChange,
                        controller: _lastNameCtrl,
                        hintText: 'Last name'),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GTextField(
                        stream: _authBloc.email,
                        onChanged: _authBloc.emailOnChange,
                        controller: _emailCtrl,
                        hintText: 'Email address'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GTextField(
                        stream: _authBloc.phone,
                        controller: _phoneCtrl,
                        hintText: 'Phone number',
                        onChanged: _authBloc.phoneOnChange),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GTextField(
                        isSecret: true,
                        stream: _authBloc.password,
                        onChanged: _authBloc.passwordOnChange,
                        controller: _passwordCtrl,
                        hintText: 'Password'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: GTextField(
                          isSecret: true,
                          stream: _authBloc.password,
                          controller: _confirmPasswordCtrl,
                          hintText: 'Confirm Password')),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              GTextField(
                  stream: _authBloc.aboutUs,
                  onChanged: _authBloc.aboutUsOnChange,
                  controller: _aboutUsCtrl,
                  hintText: 'How do you hear about us?'),
              const SizedBox(
                height: 25,
              ),
              Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: GButton(
                        isValid: _authBloc.isCreateAccountValid,
                        onPressed: () {
                          if (_passwordCtrl.text == _confirmPasswordCtrl.text) {
                            provider
                                .register(
                                    firstName: _firstNameCtrl.text,
                                    lastName: _lastNameCtrl.text,
                                    email: _emailCtrl.text,
                                    phone: _phoneCtrl.text,
                                    password: _passwordCtrl.text,
                                    aboutUs: _aboutUsCtrl.text)
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
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Center(
                    child: Text.rich(TextSpan(
                      text: "Already have account",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: " Login",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.green),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  },
),
    );
  }
}

