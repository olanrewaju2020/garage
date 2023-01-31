import 'package:flutter/material.dart';
import 'package:garage_repair/Models/vehicle.dart';
import 'package:garage_repair/Screen/Components/details/details.dart';
import 'package:garage_repair/Screen/Components/details/vic_history.dart';

class CarDetails extends StatefulWidget {
  final Vehicle vehicle;
  const CarDetails({Key? key, required this.vehicle}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
            size: 15,
          ),
        ),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 0,
              child:  Container(
                child: TabBar(
                  controller: tabController,
                  labelColor: const Color(0xff180352),
                  indicatorColor: Colors.white,
                  indicatorWeight: 2,
                  indicator: const BoxDecoration(
                      color: Color.fromRGBO(146, 146, 210, 0.1),),
                  tabs: const [
                    Tab(
                      text: 'History',
                    ),
                    Tab(
                      text: 'Details',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    History(vehicleId: widget.vehicle.uuid ?? ''),
                    SubDetails(vehicle: widget.vehicle),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
