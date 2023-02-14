import 'package:flutter/material.dart';

class ServicesDetails extends StatefulWidget {
  const ServicesDetails({Key? key}) : super(key: key);

  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
          size: 32,
        ),
        title: Text(
          'Service Details',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: Color(0xffEBEBEB),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name of inspector',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    ': Ajede Olanrenwaju',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vehicle no',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 75,
                  ),
                  Text(
                    ': A1HJFF7',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount paid',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    ': N20,000:00',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 97,
                  ),
                  Text(
                    ': Pending',
                    style: TextStyle(
                        color: Color(0xffF00808),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rating ',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 95,
                  ),
                  Text(
                    ': 3',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inspection  date',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    ': 20-05-2023',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 85,
                  ),
                  Text(
                    ': 10,Somorin,Abeokuta, Ogun State',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description ',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    ': Description on the previous inspection goes as follows  ',
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
