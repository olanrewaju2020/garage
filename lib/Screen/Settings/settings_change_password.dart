import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Settings/box_digit.dart';

import '../Components/g_text_field.dart';
import '../Components/g_text_field_two.dart';

class SettingChangePassword extends StatefulWidget {
  const SettingChangePassword({Key? key}) : super(key: key);

  @override
  State<SettingChangePassword> createState() => _SettingChangePasswordState();
}

class _SettingChangePasswordState extends State<SettingChangePassword> {
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
        backgroundColor: Color(0xffEBEBEB),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Change Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xff21B24B)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Enter your account name and registered email to receive a verification code',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xff646464)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Email',
                style: TextStyle(
                    color: Color(0xff646464),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  TextField(
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                      hintText: 'Email address here',
                      hintStyle: TextStyle(
                        height: 1.8,
                        color: Color(0xffAAAAAA),
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.58),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffDCDCDC)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffDCDCDC)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Digit()));
                  },
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Send',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
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
