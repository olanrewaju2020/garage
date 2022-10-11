import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class Insurance extends StatefulWidget {
  const Insurance({Key? key}) : super(key: key);

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f2),
      appBar: AppBar(
        title: Text(
          'Insurance',
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal),
        ),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          DropDownField(
            controller: motorSelected,
            hintText: "Select motor vehicle",
            items: moto,
            itemsVisibleInDropdown: 5,
            onValueChanged: (value) {
              setState(() {
                selectMoto = value;
              });
            },
          )
        ],
      ),
    );
  }
}

String selectMoto = "";

final motorSelected = TextEditingController();

List<String> moto = ["Toyota", "Lexus", "Honda"];
