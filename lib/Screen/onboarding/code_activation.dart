import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/onboarding/login.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../bloc/auth_bloc.dart';
import '../../provider/auth_provider.dart';

class CodeActivation extends StatefulWidget {
  @override
  State<CodeActivation> createState() => _CodeActivation();
}

class _CodeActivation extends State<CodeActivation> {
  bool ch1 = false;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 1),
      border: Border.all(color: Color.fromRGBO(216, 216, 216, 1)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  final _pinCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f2),
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
          'Account Activation',
          style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal),
        ),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Verify OTP',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                        color: Colors.green.shade600),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) {
                      return Pinput(
                        length: 6,
                        useNativeKeyboard: true,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        defaultPinTheme: defaultPinTheme,
                        enableSuggestions: true,
                        closeKeyboardWhenCompleted: true,
                        obscuringCharacter: '*',
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        separator: Container(
                          height: 55,
                          width: 10,
                        ),
                        onCompleted: (val) {
                          provider.activateUser(otp: val);
                          if (provider.isActivated) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Login()));
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
