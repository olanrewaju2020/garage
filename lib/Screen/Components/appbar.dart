import 'package:flutter/material.dart';

class GAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GAppBar({
    Key ? key,
    required this.screenTitle,
  }) : super(key: key);

  final String screenTitle;


  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: 20,
        ),
      ),
      title: Text(
        screenTitle,
        style: const TextStyle(
            color: Color(0xff21B24B),
            fontSize: 22,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal),
      ),
      elevation: 0,
      backgroundColor: const Color(0xffEBEBEB),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
