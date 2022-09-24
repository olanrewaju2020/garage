import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/larry.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildGestureDetector(context, 'Contact details'),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              buildGestureDetector(context, 'My account manager'),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              buildGestureDetector(context, 'Payment'),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              buildGestureDetector(context, 'Change password'),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              buildGestureDetector(context, 'Service history'),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              buildGestureDetector(context, 'Support'),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              buildGestureDetector(context, 'Terms & conditions'),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              buildGestureDetector(context, 'Privacy policy'),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              buildGestureDetector(context, 'Log out'),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ],
          ),
          Divider(
            height: 10,
            thickness: 2,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
