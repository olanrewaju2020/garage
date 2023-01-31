import 'package:flutter/material.dart';

import '../Components/g_button.dart';
import '../Components/g_text_field_two.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEBEBEB),
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 32,
          ),
          title: Text(
            'Profile ',
            style: TextStyle(
                color: Color(0xff21B24B),
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal),
          ),
          elevation: 0,
          backgroundColor: Color(0xffEBEBEB),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: (SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Image.asset(
                  'assets/images/avata.png',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'Akanni Julius',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: 0.4,
                      color: Color(0xff21B24B)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff646464)),
              ),
              Text(
                'mechanic@gmail.ng ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffAAAAAA)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Phone Number ',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff646464)),
              ),
              Text(
                '+2348123456789',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffAAAAAA)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'City/Region ',
                style: TextStyle(
                    color: Color(0xff646464),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
              SizedBox(
                height: 8,
              ),
              Stack(
                alignment: const Alignment(0, 0),
                children: <Widget>[
                  GTextFieldTwo(
                    hintText: '- - - - - - - - - - - - - - - - - - -',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Address 1(Home)',
                style: TextStyle(
                    color: Color(0xff646464),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
              SizedBox(
                height: 8,
              ),
              Stack(
                alignment: const Alignment(0, 0),
                children: <Widget>[
                  GTextFieldTwo(
                    hintText: '- - - - - - - - - - - - - - - - - - -',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Address 1(Work)',
                style: TextStyle(
                    color: Color(0xff646464),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
              SizedBox(
                height: 8,
              ),
              Stack(
                alignment: const Alignment(0, 0),
                children: <Widget>[
                  GTextFieldTwo(
                    hintText: '- - - - - - - - - - - - - - - - - - -',
                  ),
                ],
              ),

              SizedBox(
                height: 40,
              ),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: GButton(
                  label: 'Save',
                  onPressed: () async {},
                ),
              )
            ],
          ))),
        ));
  }
}
