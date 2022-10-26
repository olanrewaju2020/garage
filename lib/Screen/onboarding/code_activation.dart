import 'package:flutter/material.dart';

import 'login.dart';

class CodeActivation extends StatefulWidget {
  const CodeActivation({Key? key}) : super(key: key);

  @override
  State<CodeActivation> createState() => _CodeActivationState();
}

class _CodeActivationState extends State<CodeActivation> {
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
          'Activation',
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
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Enter the code sent to your register mail',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email address',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Login()));
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
