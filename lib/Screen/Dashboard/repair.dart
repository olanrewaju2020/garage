import 'package:flutter/material.dart';

class Repair extends StatefulWidget {
  const Repair({Key? key}) : super(key: key);

  @override
  State<Repair> createState() => _RepairState();
}

class _RepairState extends State<Repair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Repair Screen'),
      ),
    );
  }
}
