import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Previous extends StatefulWidget {
  const Previous({Key? key}) : super(key: key);

  @override
  State<Previous> createState() => _PreviousState();
}

class _PreviousState extends State<Previous> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 13,
                ),
                Text(
                  'Vin no',
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400]),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'AJ11AH',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Date',
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400]),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '12-05-2000',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.print,
                  size: 17,
                  color: Colors.green,
                ),
                SizedBox(
                  height: 3,
                ),
                RatingBar.builder(
                  minRating: 1,
                  updateOnDrag: true,
                  itemSize: 20,
                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Pending', style: TextStyle(
                  fontSize: 10,
                  color: Colors.red
                ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
