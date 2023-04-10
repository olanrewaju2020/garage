import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../g_button.dart';

class HourGrid extends StatefulWidget {
  final TextEditingController selectedHour;

  const HourGrid({
    super.key,
    required this.selectedHour,
  });

  @override
  State<HourGrid> createState() => _HourGridState();
}

class _HourGridState extends State<HourGrid> {
  final List<DateTime> hours = List.generate(11, (index) => DateTime(2023, 1, 1, index + 8));

  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 1 / .5,
      children: hours.map((hour) {
        String formattedHour = DateFormat('h a').format(hour);
        return GOutlineButton(
          isActive: selectedTime == formattedHour ? true : false,
            onTap: () {
              widget.selectedHour.text = formattedHour;
              setState(() {
                  selectedTime = formattedHour;
              });
            },
            label: formattedHour);
      }).toList(),
    );
  }
}