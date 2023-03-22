import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../Models/user.dart';
import '../New Screens/New Services screen/book_machanic.dart';

class ProfileCardHorizontal extends StatelessWidget {
  final User user;
  const ProfileCardHorizontal({
    super.key, required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookMechanic(mechanic: user))),
      child: Column(
        children: [
          Container(
            height: 95,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: 18, vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color(0xff21B24B),
              ),
              borderRadius: BorderRadius.circular(23),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/images/woman.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName,
                        style: TextStyle(
                            color: Color(0xff0D0221),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 3),
                      Text(
                        user.address ?? '',
                        style: TextStyle(
                            color: Color(0xff282828),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding:
                      const EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}