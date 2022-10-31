import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

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
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
            size: 15,
          ),
        ),
        title: Text(
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
              padding: EdgeInsets.symmetric(horizontal: 18),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Verify OTP', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                    color: Colors.green.shade600
                  ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  StreamBuilder<String>(builder: (context, snapshot) {
                    return Pinput(
                      length: 6,
                      useNativeKeyboard: true,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      defaultPinTheme: defaultPinTheme,
                      enableSuggestions: true,
                      closeKeyboardWhenCompleted: true,
                      obscuringCharacter: '*',
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      separator: Container(
                        height: 55,
                        width: 10,
                      ),
                    );
                  }),
                  SizedBox(
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
