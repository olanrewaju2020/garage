import 'package:flutter/material.dart';

class GButton extends StatelessWidget {
  final Stream<bool>? isValid;
  const GButton({
    Key? key,
    required this.onPressed, required this.label, this.isValid
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
              snapshot.data != null) ? ()=> onPressed() : null,
          child:
          //provider.status == ApiStatus.loading ? const Center(child: CircularProgressIndicator()) :
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