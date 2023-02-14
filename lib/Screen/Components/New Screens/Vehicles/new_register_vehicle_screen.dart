import 'package:flutter/material.dart';

import '../../g_button.dart';
import '../../g_text_field_two.dart';

class NewRegisterVehicleScreen extends StatefulWidget {
  const NewRegisterVehicleScreen({Key? key}) : super(key: key);

  @override
  State<NewRegisterVehicleScreen> createState() =>
      _NewRegisterVehicleScreenState();
}

class _NewRegisterVehicleScreenState extends State<NewRegisterVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: 20,
        ),
        title: Text(
          'Register Vehicle',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: Color(0xffEBEBEB),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                  'Enter your Vehicle identification Number to register your vehicles ',
                  style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff282828)),
                ),

              SizedBox(
                height: 50,
              ),
              Text(
                'Vehicle Type',
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
                'Vehicle Identification Number',
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Complete  Registration',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
