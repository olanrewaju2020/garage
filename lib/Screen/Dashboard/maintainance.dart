import 'package:flutter/material.dart';
import '../Components/add_maintaince.dart';
import '../Components/maintenance_history.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
          'Maintenance',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MaintenanceHistory()));
                  },
                  child: Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 18,
                              ),
                              Text(
                                'Vin no',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[400]),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'AJ64RT',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 18,
                              ),
                              Text(
                                'Engineer',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[400]),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'Ajede Olanrewaju',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey[400],)
                        ],
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddMaintaincePlan(),
          ));
        },
      ),
    );
  }
}
