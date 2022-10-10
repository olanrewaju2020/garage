import 'package:flutter/material.dart';

class ContactPerson extends StatefulWidget {
  const ContactPerson({Key? key}) : super(key: key);

  @override
  State<ContactPerson> createState() => _ContactPersonState();
}

class _ContactPersonState extends State<ContactPerson> {
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
          'Inspector Details',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  print('working');
                },
                child: ListTile(
                  title: (Text(
                    'Ajede Olanrewaju',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                  subtitle: (Text(
                    '09093104312',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  )),
                  trailing: Text(
                    '10,somorin,abk,ogun-state',
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('working');
                },
                child: ListTile(
                  title: (Text(
                    'Ajede Olanrewaju',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                  subtitle: (Text(
                    '09093104312',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  )),
                  trailing: Text(
                    '10,somorin,abk,ogun-state',
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('working');
                },
                child: ListTile(
                  title: (Text(
                    'Ajede Olanrewaju',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                  subtitle: (Text(
                    '09093104312',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  )),
                  trailing: Text(
                    '10,somorin,abk,ogun-state',
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('working');
                },
                child: ListTile(
                  title: (Text(
                    'Ajede Olanrewaju',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                  subtitle: (Text(
                    '09093104312',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  )),
                  trailing: Text(
                    '10,somorin,abk,ogun-state',
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('working');
                },
                child: ListTile(
                  title: (Text(
                    'Ajede Olanrewaju',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                  subtitle: (Text(
                    '09093104312',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  )),
                  trailing: Text(
                    '10,somorin,abk,ogun-state',
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('working');
                },
                child: ListTile(
                  title: (Text(
                    'Ajede Olanrewaju',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                  subtitle: (Text(
                    '09093104312',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  )),
                  trailing: Text(
                    '10,somorin,abk,ogun-state',
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('working');
                },
                child: ListTile(
                  title: (Text(
                    'Ajede Olanrewaju',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                  subtitle: (Text(
                    '09093104312',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  )),
                  trailing: Text(
                    '10,somorin,abk,ogun-state',
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
