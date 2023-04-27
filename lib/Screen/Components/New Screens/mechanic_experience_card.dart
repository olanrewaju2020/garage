import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:garage_repair/Screen/Components/New%20Screens/New%20Services%20screen/list_of_mechanic.dart';

import '../../../Models/user.dart';

class MechanicExperienceCard extends StatelessWidget {
  final User mechanic;
  final Widget route;
  const MechanicExperienceCard({
    super.key, required this.mechanic, required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => route)
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/person1.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mechanic.fullName ?? '',
                        style: const TextStyle(
                            color: Color(0xff0D0221),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        '5 years experience',
                        style: TextStyle(
                            color: Color(0xff282828),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 20.0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  //print(rating);
                },
              )),
        ],
      );
  }
}