
import 'package:flutter/material.dart';

import '../../misc/enum.dart';
import 'New Screens/New Services screen/list_of_mechanic.dart';

class ChatWithMechanic extends StatelessWidget {
  final ChatType chatType;
  final ServiceType serviceType;
  const ChatWithMechanic({
    super.key, this.chatType = ChatType.chat, required this.serviceType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ListOfMechanic(
                serviceType: serviceType,
                chatType: chatType))
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Image(
            image: AssetImage('assets/images/message.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 15),
            child: Text(
              'Chat with Mechanic',
              style: TextStyle(
                  color: Color(0xff646464),
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xff7E808A),
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}