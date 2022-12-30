import 'package:flutter/material.dart';

class SubDetails extends StatefulWidget {
  const SubDetails({Key? key}) : super(key: key);

  @override
  State<SubDetails> createState() => _SubDetailsState();
}

class _SubDetailsState extends State<SubDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f2),
      body: Padding(
        padding: const EdgeInsets.only(top: 38.0),
        child: Material(
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
                      const Text('99879377373829347')
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
                      const Text('Model',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13)),
                      const Text('Toyota')
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
                      const Text('Make',
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
                    children: [
                      Text('Type',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13)),
                      Text('Truck')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
      ),
    );
  }
}
