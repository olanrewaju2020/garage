import 'package:dotted_border/dotted_border.dart';
import 'package:garage_repair/Screen/Components/g_button.dart';
import 'package:garage_repair/misc/utils.dart';
import 'package:garage_repair/provider/vehicle_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/appbar.dart';
import 'package:provider/provider.dart';

import '../../../../misc/enum.dart';
import '../hour_grid.dart';

class SelectBookDate extends StatefulWidget {
  final String? mechanicId;
  const SelectBookDate({Key? key, this.mechanicId}) : super(key: key);

  @override
  State<SelectBookDate> createState() => _SelectBookDateState();
}

class _SelectBookDateState extends State<SelectBookDate> {
  List<String> monthsList = [];
  List<String> daysOfWeek = [];
  List<String> datesOfWeek = [];
  int activeMonthNum = 0;
  String currentMonth = '';
  String currentDate = '';
  String selectedDate = '';
  final controller = TextEditingController();

  getCurrentMonth() {
    DateFormat formatter = DateFormat('MMMM yyyy');
    currentMonth = formatter.format(DateTime.now());
  }

  getListOfDaysInAWeek({DateTime? date}) {
    List<String> days = [];
    List<String> dates = [];

    final now = date ?? DateTime.now();
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));

    for (int i = 0; i < 7; i++) {
      DateTime date = firstDayOfWeek.add(Duration(days: i));
      String formattedDay = DateFormat('E').format(date);
      String formattedDate = DateFormat('d').format(date);
      days.add(formattedDay);
      dates.add(formattedDate);
    }
    daysOfWeek = days;
    datesOfWeek = dates;
  }

  getListOfMonth() {
    DateFormat formatter = DateFormat('MMMM yyyy');
    final now =
        currentMonth.isEmpty ? DateTime.now() : formatter.parse(currentMonth);

    List<String> months = [];
    for (int i = -12; i <= 12; i++) {
      DateTime month = DateTime(now.year, now.month + i, 1);
      String formattedMonth = formatter.format(month);
      months.add(formattedMonth);
    }

    monthsList = months;
  }

  @override
  void initState() {
    getCurrentMonth();
    getListOfMonth();
    getListOfDaysInAWeek();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: const GAppBar(screenTitle: 'Select Date'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<VehicleProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          previousMonth(currentMonth);
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                    Text(currentMonth),
                    GestureDetector(
                        onTap: () {
                          nextMonth(currentMonth);
                        },
                        child: const Icon(Icons.arrow_forward_ios))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      daysOfWeek.length,
                      (index) => GestureDetector(
                            onTap: () {
                              currentDate = datesOfWeek[index];
                              setState(() {
                                selectedDate = datesOfWeek[index];
                              });
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              color: selectedDate == datesOfWeek[index] ? Colors.transparent : Colors.green,
                              radius: const Radius.circular(12),
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                padding: selectedDate == datesOfWeek[index] ? const EdgeInsets.symmetric(vertical: 20, horizontal: 10) : const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: selectedDate == datesOfWeek[index] ? Colors.green : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                               
                                child: Column(
                                    children: [
                                      Text(daysOfWeek[index]),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      Text(datesOfWeek[index])
                                    ],
                                  ),
                              ),
                            ),
                          )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          DateFormat formatter = DateFormat('d MMMM yyyy');
                          String date = '${datesOfWeek[0]} $currentMonth';
                          DateTime dateTime = formatter.parse(date);
                          getListOfDaysInAWeek(
                              date: dateTime.subtract(const Duration(days: 1)));
                        });
                      },
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          DateFormat formatter = DateFormat('d MMMM yyyy');
                          String date = '${datesOfWeek[6]} $currentMonth';
                          DateTime dateTime = formatter.parse(date);
                          getListOfDaysInAWeek(
                              date: dateTime.add(const Duration(days: 1)));
                        });
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: GOutlineButton(
                        label: 'Morning',
                        icon: Icons.sunny,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: GOutlineButton(
                        label: 'Afternoon',
                        icon: Icons.sunny,
                        isActive: true,
                      ),
                    ),
                  ],
                ),
                const Text("Choose the hour"),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: HourGrid(selectedHour: controller)),
                SizedBox(
                  width: double.infinity,
                  child: GButton(
                    isLoading: provider.isLoading,
                      isValid: Stream.value(true),
                      onPressed: () {
                        if(controller.text.isNotEmpty && selectedDate.isNotEmpty) {
                          DateTime selectedDate = DateFormat('d MMMM yyyy h a')
                              .parse(
                                  '$currentDate $currentMonth ${controller.text}');
                          provider.bookMechanic(
                              context: context,
                              mechanicId: widget.mechanicId,
                              date: selectedDate,
                              serviceType: provider.serviceType);
                        } else {
                          ShowToast(msg: 'Select date and time', type: ErrorType.error);
                        }
                      },
                      label: 'Book Appointment'),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void nextMonth(String month) {
    setState(() {
      int currentMonthIndex = monthsList.indexOf(month);
      if (currentMonthIndex < monthsList.length - 1) {
        currentMonth = monthsList[currentMonthIndex + 1];
      } else {
        getCurrentMonth();
        currentMonth = monthsList[currentMonthIndex + 1];
      }
    });
  }

  void previousMonth(String month) {
    setState(() {
      int currentMonthIndex = monthsList.indexOf(month);
      if (currentMonthIndex > 0) {
        currentMonth = monthsList[currentMonthIndex - 1];
      } else {
        getCurrentMonth();
        currentMonth = monthsList[currentMonthIndex - 1];
      }
    });
  }
}


