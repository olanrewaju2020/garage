import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Dashboard/dashboard.dart';
import 'package:garage_repair/Screen/onboarding/create_account.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xfff4f4f2),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.07,
                ),
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
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
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    alignment: const Alignment(0, 0),
                    children: <Widget>[
                      TextField(
                        obscureText: true,
                        autofocus: false,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'password',
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
                      Positioned(right: 15, child: Icon(Icons.remove_red_eye))
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      'Forgot password',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
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
                                  builder: (context) => new Dashboard()));
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new CreateAccount()));
                  },
                  child: const Center(
                    child: Text.rich(TextSpan(
                      text: "Don't have an account",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: " Register",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.green),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
