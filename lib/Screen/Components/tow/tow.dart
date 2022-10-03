import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/tow/sub_tow.dart';

import '../../Dashboard/vehicle.dart';

class Towing extends StatefulWidget {
  const Towing({Key? key}) : super(key: key);

  @override
  State<Towing> createState() => _TowingState();
}

class _TowingState extends State<Towing> {
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
          'Rescue Service',
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SubTowing()));
                },
                child: vehicle()),
          )
        ],
      ),
    );
  }
}
