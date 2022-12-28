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
      body: SingleChildScrollView(
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
                        stream: authBloc.firstName,
                        controller: _firstNameCtrl,
                        onChanged: authBloc.firstNameOnChange,
                        hintText: 'First name'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GTextField(
                        stream: authBloc.lastName,
                        onChanged: authBloc.lastNameOnChange,
                        controller: _lastNameCtrl,
                        hintText: 'Last name'),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GTextField(
                        stream: authBloc.email,
                        onChanged: authBloc.emailOnChange,
                        controller: _emailCtrl,
                        hintText: 'Email address'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GTextField(
                        stream: authBloc.phone,
                        controller: _phoneCtrl,
                        hintText: 'Phone number',
                        onChanged: authBloc.phoneOnChange),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GTextField(
                        stream: authBloc.password,
                        onChanged: authBloc.passwordOnChange,
                        controller: _passwordCtrl,
                        hintText: 'Password'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: GTextField(
                          stream: authBloc.password,
                          controller: _confirmPasswordCtrl,
                          hintText: 'Confirm Password')),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              GTextField(
                  stream: authBloc.aboutUs,
                  onChanged: authBloc.aboutUsOnChange,
                  controller: _aboutUsCtrl,
                  hintText: 'How do you hear about us?'),
              const SizedBox(
                height: 25,
              ),
              Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
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
                                Navigator.push(
                                    context,
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
  final bool isSecret;
  final IconData? suffixIconData;
  const GTextField({
    Key? key,
    this.controller,
    this.hintText,
    required this.stream,
    this.isSecret = false,
    this.onChanged,
    this.suffixIconData,
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
            controller: widget.controller,
            style: const TextStyle(fontSize: 12.0, height: 2.1, color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // color: Colors.green
                      ),
                      width: 15,
                      child: Icon(widget.suffixIconData,
                          color: Colors.black, size: 15))),
              border: InputBorder.none,
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
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
            onChanged: widget.onChanged == null
                ? null
                : (val) => widget.onChanged!(val),
            obscureText: widget.isSecret,
          );
        });
  }
}
