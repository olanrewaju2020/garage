import 'package:flutter/material.dart';

import '../../g_text_field_two.dart';

class AddNewVehicleScreen extends StatefulWidget {
  const AddNewVehicleScreen({Key? key}) : super(key: key);

  @override
  State<AddNewVehicleScreen> createState() => _AddNewVehicleScreenState();
}

class _AddNewVehicleScreenState extends State<AddNewVehicleScreen> {
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
          'Add New Vehicle',
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
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        'Add',
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
