import 'package:flutter/material.dart';

class GButton extends StatelessWidget {
  final Stream<bool>? isValid;
  bool isLoading;
  GButton({
    Key? key,
    required this.onPressed, required this.label, this.isValid, this.isLoading = false
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: isValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          onPressed: (snapshot.hasData &&
              snapshot.data != null) ? (isLoading ? () {} : ()=> onPressed() ): null,
          child:
          isLoading ? const Center(child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )) :
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
          ),
        );
      }
    );
  }
}