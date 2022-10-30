import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/onboarding/login.dart';
import 'package:provider/provider.dart';

import '../../bloc/auth_bloc.dart';
import '../../provider/auth_provider.dart';
import '../misc/enum.dart';
import '../misc/utils.dart';
import 'code_activation.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final authBloc = AuthBloc();
  TextEditingController _firstNameCtrl = TextEditingController();
  TextEditingController _lastNameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _phoneCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _confirmPasswordCtrl = TextEditingController();
  TextEditingController _aboutUsCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 150,
                  height: 150,
                ),
              ),
              GTextField(
                  stream: authBloc.firstName,
                  controller: _firstNameCtrl,
                  onChanged: authBloc.firstNameOnChange,
                  hintText: 'First name'),
              SizedBox(
                height: 20,
              ),
              GTextField(
                stream: authBloc.lastName,
                  onChanged: authBloc.lastNameOnChange,
                  controller: _lastNameCtrl, hintText: 'Last name'),
              // TextField(
              //   autofocus: false,
              //   style: TextStyle(fontSize: 15.0, color: Colors.black),
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Last name',
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding:
              //         const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              GTextField(
                stream: authBloc.email,
                  onChanged: authBloc.emailOnChange,
                  controller: _emailCtrl, hintText: 'Email address'),
              // TextField(
              //   autofocus: false,
              //   style: TextStyle(fontSize: 15.0, color: Colors.black),
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Email address',
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding:
              //         const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              GTextField(
                stream: authBloc.phone,
                  controller: _phoneCtrl,
                  hintText: 'Phone number',
                onChanged: authBloc.phoneOnChange
              ),
              // TextField(
              //   autofocus: false,
              //   style: TextStyle(fontSize: 15.0, color: Colors.black),
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Phone number',
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding:
              //         const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              GTextField(
                stream: authBloc.password,
                  onChanged: authBloc.passwordOnChange,
                  controller: _passwordCtrl, hintText: 'Password'),
              // TextField(
              //   autofocus: false,
              //   style: TextStyle(fontSize: 15.0, color: Colors.black),
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Password',
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding:
              //         const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              GTextField(
                stream: authBloc.password,
                  controller: _confirmPasswordCtrl,
                  hintText: 'Confirm Password'),
              // TextField(
              //   autofocus: false,
              //   style: TextStyle(fontSize: 15.0, color: Colors.black),
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Confirm Password',
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding:
              //         const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              GTextField(
                stream: authBloc.aboutUs,
                  onChanged:  authBloc.aboutUsOnChange,
                  controller: _aboutUsCtrl, hintText: 'How do you hear about us?'),
              // TextField(
              //   autofocus: false,
              //   style: const TextStyle(fontSize: 15.0, color: Colors.black),
              //   decoration: InputDeHow do you hear about us?coration(
              //     border: InputBorder.none,
              //     hintText: '',
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding:
              //         const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: const BorderSide(color: Colors.white),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 35,
              ),
              Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          if(_passwordCtrl.text == _confirmPasswordCtrl.text) {
                            provider.register(
                                firstName: _firstNameCtrl.text,
                                lastName: _lastNameCtrl.text,
                                email: _emailCtrl.text,
                                phone: _phoneCtrl.text,
                                password: _passwordCtrl.text,
                                aboutUs: _aboutUsCtrl.text).then((isSuccessful) {
                                  if(isSuccessful) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const CodeActivation()));
                                  }
                            });
                          } else {
                            ShowToast(msg: 'Password fields do not match', type: ErrorType.error);
                          }


                        },
                        child: const Text(
                          'Create account',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  );
                },
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
      ),
    );
  }
}

class GTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Stream<String>? stream;
  final Function(String name)? onChanged;
  const GTextField({
    Key? key,
    this.controller,
    this.hintText, required this.stream, this.onChanged,
  }) : super(key: key);

  @override
  State<GTextField> createState() => _GTextFieldState();
}

class _GTextFieldState extends State<GTextField> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.stream,
      builder: (context, snapshot) {
        return TextField(
          autofocus: false,
          controller: widget?.controller,
          style: const TextStyle(fontSize: 15.0, color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.redAccent,
                ),
                borderRadius: BorderRadius.circular(10)),
            hintText: widget.hintText,
            errorText: snapshot.hasError ? '${snapshot.error}' : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onChanged: widget.onChanged == null ? null : (val) => widget.onChanged!(val),
        );
      }
    );
  }
}
