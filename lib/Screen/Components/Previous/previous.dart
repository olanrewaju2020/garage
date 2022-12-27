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
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                      'VIN',
                      style: Theme.of(context).textTheme.headlineSmall
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    'AJ11AH',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              Text(
                '12-05-2000',
                style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text("N200,000", style: Theme.of(context).textTheme.titleSmall),
             const SizedBox(
                height: 3,
              ),
              Text('Vehicle Inspection', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
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
    );
  }
}
