import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GLoader extends StatelessWidget {
  const GLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitCubeGrid(
        color: Colors.green,
        size: 50.0,
      ),
    );
  }
}