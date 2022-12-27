import 'package:flutter/material.dart';

class GButton extends StatelessWidget {
  const GButton({
    Key? key,
    required this.onPressed, required this.label
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: () => onPressed(),
      child:
      //provider.status == ApiStatus.loading ? const Center(child: CircularProgressIndicator()) :
      Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }
}