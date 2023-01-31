import 'package:flutter/material.dart';
import 'package:garage_repair/Models/vehicle.dart';

class SubDetails extends StatefulWidget {
  final Vehicle vehicle;
  const SubDetails({Key? key, required this.vehicle}) : super(key: key);

  @override
  State<SubDetails> createState() => _SubDetailsState();
}

class _SubDetailsState extends State<SubDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f2),
      body: Material(
        child: Container(
          height: 320,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                )
              ]),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'VIN',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 13),
                    ),
                    Text(widget.vehicle?.vehicleNumber ?? '')
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Model',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13)),
                    Text(widget.vehicle.model ?? '')
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Make',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13)),
                    Text('')
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Series',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13)),
                    const Text('')
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Type',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13)),
                    Text('Truck')
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Cylinder',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13)),
                    Text('8')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
