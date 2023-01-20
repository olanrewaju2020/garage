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
      // appBar: AppBar(
      //   leading: InkWell(
      //     onTap: () => Navigator.of(context).pop(),
      //     child: const Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.green,
      //       size: 15,
      //     ),
      //   ),
      //   centerTitle: true,
      //   elevation: 0.3,
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                      child: Image(
                    image: AssetImage('assets/images/inbox.png'),
                    width: 300,
                    height: 300,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'Please enter the six digit code sent to \nyour registered email address.',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Consumer<AuthProvider>(
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
                            width: 5,
                          ),
                          onCompleted: (val) {
                            provider.activateUser(otp: val, context: context);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'Resend code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: Colors.black87),
                    ),
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
