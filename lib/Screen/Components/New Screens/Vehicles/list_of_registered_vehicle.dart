import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/vehicle_provider.dart';
import '../../../../service_locator.dart';
import '../../../g_loader.dart';

class ListOfRegisteredVehicle extends StatefulWidget {
  const ListOfRegisteredVehicle({Key? key}) : super(key: key);

  @override
  State<ListOfRegisteredVehicle> createState() =>
      _ListOfRegisteredVehicleState();
}

class _ListOfRegisteredVehicleState extends State<ListOfRegisteredVehicle> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VehicleProvider>(context, listen: false).vehiclesOwnList(ownerId: app.user?.uuid ?? '');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          'Registered Vehicles ',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffEBEBEB),
      ),
      body: Consumer<VehicleProvider>(
  builder: (context, provider, child) {
  return provider.isLoading ? const GLoader() : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'List of Vehicles',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff646464),
                    fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * .6,
                  child: ListView(
                      children: List.generate(app.vehiclesOwn.length, (index) =>  Container(
                          height: 100,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Image(
                                        image: AssetImage('assets/images/toyota.png'),
                                        width: 90,
                                      ),
                                     const SizedBox(
                                        height: 3,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        app.vehiclesOwn[index].regNumber ?? '',
                                        style: const TextStyle(
                                            color: Color(0xff646464),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        app.vehiclesOwn[index].createdAt ?? '',
                                        style: const TextStyle(
                                            color: Color(0xff646464),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Color(0xff9D8E8E),
                              ),
                            ],
                          )))
                  )
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Add to Vehicles',
                    style: TextStyle(color: Color(0xff21B24B)),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: Color(0xff21B24B)),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  },
),
    );
  }
}
