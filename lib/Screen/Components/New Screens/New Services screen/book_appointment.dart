
import 'package:flutter/material.dart';

import '../../../../misc/enum.dart';
import 'search_new.dart';

class BookAppointment extends StatelessWidget {
  final ServiceType serviceType;

  const BookAppointment({super.key, required this.serviceType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SearchMechanic(serviceType: "inspection"))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Image(
            image: AssetImage('assets/images/cal.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 15),
            child: Text(
              'Book an appointment',
              style: TextStyle(
                  color: Color(0xff646464),
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xff7E808A),
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}