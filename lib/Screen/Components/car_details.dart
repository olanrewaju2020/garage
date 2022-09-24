import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/Components/details.dart';
import 'package:garage_repair/Screen/Dashboard/setting.dart';
import '../Components/vic_history.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({Key? key}) : super(key: key);

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
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
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
            SizedBox(
              height: 20,
            ),
            Material(
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: TabBar(
                  controller: tabController,
                  labelColor: Color(0xff180352),
                  unselectedLabelColor: Color(0xff000000),
                  indicatorColor: Colors.white,
                  indicatorWeight: 2,
                  indicator: BoxDecoration(
                      color: Color.fromRGBO(146, 146, 210, 0.1),
                      borderRadius: BorderRadius.circular(20)),
                  tabs: [
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
              child: TabBarView(
                controller: tabController,
                children: [
                  History(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: SubDetails(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
