import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({Key? key}) : super(key: key);

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 96,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Color(0xffF2F2F2),
      border: Border.all(color: Color(0xff21B24B)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff464646),
          size: 20,
        ),
        title: const Text(
          'Verify Email  ',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        backgroundColor: Color(0xffEBEBEB),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Text(
                'Enter the six digits code sent to \nmechanic @gmail.com',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: Color(0xff282828)),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Pinput(
              useNativeKeyboard: true,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              defaultPinTheme: defaultPinTheme,
              enableSuggestions: true,
              closeKeyboardWhenCompleted: true,
              obscuringCharacter: '*',
              length: 6,
              obscureText: true,
              keyboardType: TextInputType.number,
              separator: Container(
                height: 64,
                width: 1,
                // color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text.rich(TextSpan(
                text: "Didn’t receive the verification code?",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6A6F73)),
                children: [
                  TextSpan(
                    text: " Resend it",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.green),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Receive the verification via Email', style: TextStyle(
                color: Color(0xff21B24B),
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {},
                child: Text(
                  'Verify Email',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
