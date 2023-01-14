import 'dart:async';

import 'package:flutter/material.dart';

import '../../bloc/auth_bloc.dart';
import '../Components/g_button.dart';
import '../Components/g_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final bloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 160,
              ),
              const Center(
                  child: Image(
                image: AssetImage('assets/images/Fpassword.png'),
                width: 250,
              )),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'Please enter your registered email address to \nreceive a verification code.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 0.4,
                      color: Colors.black87),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: GTextField(
                  hintText: 'Enter Email',
                  stream: bloc.email,
                  onChanged: bloc.emailOnChange,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: GButton(
                    isValid: bloc.isForgotFormValid,
                    onPressed: () async {
                      // Navigator.of(context).pop();
                      String email = await bloc.email.first;
                      print("-===========================email");
                      print(email);
                      bloc.dispose();
                      Timer timer = Timer(const Duration(seconds: 10), () async {
                        print("========================timer");
                        print(await bloc.email.first);
                        Navigator.of(context).pop();
                      });
                      // timer.cancel();
                    },
                    label: "Send"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
