import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/onboarding/login.dart';

import 'code_activation.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 150,
                  height: 150,
                ),
              ),
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'First name',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Last name',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email address',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone number',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'How do you hear about us?',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
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
                              builder: (context) => new CodeActivation()));
                    },
                    child: Text(
                      'Create account',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Login()));
                  },
                  child: Center(
                    child: Text.rich(TextSpan(
                      text: "Already have account",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: " Login",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.green),
                        ),
                      ],
                    )),
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
