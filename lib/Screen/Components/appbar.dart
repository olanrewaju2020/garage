import 'package:flutter/material.dart';

class SwipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SwipeAppBar({
    Key ? key,
    required this.screenTitle,
  }) : super(key: key);

  final String screenTitle;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Icon(Icons.arrow_back_ios)
      ),
      title: screenTitle != null
          ? Center(
            child: Text(
        screenTitle,
        style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xff000000),
              fontStyle: FontStyle.normal
        ),
      ),
          )
          : Image.asset('assets/v2/icons/swipe_logo.png'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
