import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Settings/support2.dart';

class SupportOne extends StatefulWidget {
  const SupportOne({Key? key}) : super(key: key);

  @override
  State<SupportOne> createState() => _SupportOneState();
}

class _SupportOneState extends State<SupportOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff464646),
          size: 25,
        ),
        title: Text(
          'Support',
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                'assets/images/support.png',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'How can we help \nyou?',
              style: TextStyle(
                  fontFamily: "manrope",
                  color: Color(0xff646464),
                  fontWeight: FontWeight.w800,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SupportTwo()));
              },
              child: Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(216, 216, 216, 0.45),
                          blurRadius: 3)
                    ],
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.maps_ugc_outlined,
                      size: 30,
                      color: Color(0xff777777),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        'Connect to live chat',
                        style: TextStyle(
                            color: Color(0xff646464),
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Text(
                    'Send us an email',
                    style: TextStyle(
                        fontFamily: "manrope",
                        color: Color(0xff969696),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'garage@company.org',
                    style: TextStyle(
                        fontFamily: "manrope",
                        color: Color(0xff21B24B),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
