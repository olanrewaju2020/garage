import 'package:flutter/material.dart';

class ReviewMechanic extends StatefulWidget {
  const ReviewMechanic({Key? key}) : super(key: key);

  @override
  State<ReviewMechanic> createState() => _ReviewMechanicState();
}

class _ReviewMechanicState extends State<ReviewMechanic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8E8E8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/back.png',
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Review Mechanic',
                  style: TextStyle(
                      color: Color(0xff646464),
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('How was your experience with...', style: TextStyle(
                color: Color(0xff646464),
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: 0.5
              ),),
            ),
            SizedBox(
              height: 3,
            ),
            Center(
              child: Text('Adekola Seyi', style: TextStyle(
                  color: Color(0xff21B24B),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  letterSpacing: 0.5
              ),),
            )
          ],
        ),
      ),
    );
  }
}
