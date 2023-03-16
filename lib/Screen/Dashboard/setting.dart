import 'package:flutter/material.dart';

import '../Settings/change_password.dart';
import '../Settings/contact_details.dart';
import '../Settings/history.dart';
import '../Settings/logout.dart';
import '../Settings/settings_change_password.dart';
import '../Settings/support.dart';
import '../Settings/support1.dart';
import '../Settings/user_profile.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 32,
          ),
        ),
        title: Text(
          'Settings ',
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(29.5)),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: 'Search Settings',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(12, 12, 12, 0.22),
                    ),
                    icon: Icon(Icons.search, color: Color.fromRGBO(12, 12, 12, 0.22),),
                    border: InputBorder.none),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Profile()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.account_circle,
                            size: 30,
                            color: Color(0xff646464),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Edit Profile',
                            style: TextStyle(color: Color(0xff646464), fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 17,
                      )
                    ],
                  ),
                ),
              ),
            ),

            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(color: Color(0xff7E808A),),
            ),
            const SizedBox(
              height: 8,
            ),


            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ChangePassword()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 30,
                            color: Color(0xff646464),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Notification',
                            style: TextStyle(color: Color(0xff646464), fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 17,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(color: Color(0xff7E808A),),
            ),

            SizedBox(
              height: 8,
            ),


            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SettingChangePassword()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lock,
                            size: 30,
                            color: Color(0xff646464),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Change Password',
                            style: TextStyle(color: Color(0xff646464), fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 17,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(color: Color(0xff7E808A),),
            ),

            SizedBox(
              height: 8,
            ),


            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Historys()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.change_history,
                            size: 30,
                            color: Color(0xff646464),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'History',
                            style: TextStyle(color: Color(0xff646464), fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 17,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(color: Color(0xff7E808A),),
            ),

            SizedBox(
              height: 8,
            ),


            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SupportOne()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.security_rounded,
                            size: 30,
                            color: Color(0xff646464),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Contact Support ',
                            style: TextStyle(color: Color(0xff646464), fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 17,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(color: Color(0xff7E808A),),
            ),

            SizedBox(
              height: 8,
            ),


            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ChangePassword()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.question_mark_sharp,
                            size: 30,
                            color: Color(0xff646464),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Terms & Condition ',
                            style: TextStyle(color: Color(0xff646464), fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 17,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(color: Color(0xff7E808A),),
            ),

            SizedBox(
              height: 8,
            ),


            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ChangePassword()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 30,
                            color: Color(0xff21B24B),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Log Out',
                            style: TextStyle(color: Color(0xff646464), fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 17,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
