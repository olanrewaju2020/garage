import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:garage_repair/Models/service.dart';
import 'package:garage_repair/Screen/Components/Previous/previous_details.dart';
import 'package:garage_repair/Screen/Dashboard/dashboard.dart';

class Previous extends StatefulWidget {
  final GService service;
  final Widget? route;
  const Previous(
      {Key? key, required this.service, this.route})
      : super(key: key);

  @override
  State<Previous> createState() => _PreviousState();
}

class _PreviousState extends State<Previous> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => widget.route ?? Dashboard()));
      },
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8),
        margin: const EdgeInsets.only(bottom: 24),
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
                    Text('VIN',
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.service.vehicle?.vehicleNumber ?? "",
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
                Text(widget.service?.datePosted ?? '',
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text("N${widget.service?.cost ?? '0.00'}",
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(
                  height: 3,
                ),
                Text(widget.service?.description ?? '',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  widget.service?.status ?? "",
                  style: const TextStyle(fontSize: 10, color: Colors.red),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
