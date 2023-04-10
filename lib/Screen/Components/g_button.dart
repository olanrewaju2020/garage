import 'package:flutter/material.dart';

class GButton extends StatelessWidget {
  final Stream<bool>? isValid;
  final Color backgroundColor;
  final Color textColor;
  bool isLoading;
  GButton({
    Key? key,
    required this.onPressed, required this.label, this.isValid, this.isLoading = false, this.backgroundColor = Colors.green, this.textColor = Colors.white
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
            backgroundColor: backgroundColor,
          ),
          onPressed: (snapshot.hasData &&
              snapshot.data != null) ? (isLoading ? () {} : ()=> onPressed() ): null,
          child:
          isLoading ? const Center(child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )) :
          Text(
            label,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w600, fontSize: 13),
          ),
        );
      }
    );
  }
}


class GOutlineButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isActive;
  final VoidCallback? onTap;

  const GOutlineButton({Key? key, this.label='',
    this.icon, this.isActive = false, this.onTap, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green),
          color: isActive ? Colors.green : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon != null)
            Icon(icon, color: isActive ? Colors.white : Colors.black),
            const SizedBox(width: 10,),
            Text(label, style: TextStyle(
                color:  isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600, fontSize: 13),),
          ],
        ),
      ),
    );
  }
}
