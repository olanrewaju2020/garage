import 'package:flutter/material.dart';

class SupportTwo extends StatefulWidget {
  const SupportTwo({Key? key}) : super(key: key);

  @override
  State<SupportTwo> createState() => _SupportTwoState();
}

class _SupportTwoState extends State<SupportTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff464646),
          size: 20,
        ),
        title: Text(
          'Support',
          style: TextStyle(
              color: Color(0xff21B24B),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        elevation: 0,
        backgroundColor: Color(0xffEBEBEB),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/chat.png',
                    width: 40,
                  ),
                  Flexible(
                      child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xffF1F2F6),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Text(
                      'Many have unsuccessfully launched a business venture that is internet based but only a handful.',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff232340),
                          fontSize: 13,
                          height: 1.4),
                    ),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  '8m ago',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7E808A),
                      fontSize: 10,
                      height: 1.4),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                      child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xff21B24B),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                    child: Text(
                      'Many have unsuccessfully launched a business venture that is internet based but only a handful.',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xffffffff),
                          fontSize: 13,
                          height: 1.4),
                    ),
                  )),
                  Image.asset(
                    'assets/images/chat2.png',
                    width: 40,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Text(
                    'Just now',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xffADADAD),
                        fontSize: 10,
                        height: 1.4),
                  ),
                ),
              ),

              Positioned(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/chat2.png',
                      width: 45,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Container(
                        height: 115,
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Compose a message',
                              hintStyle: TextStyle(
                                  color: Color(0xff7A869A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              suffixText: 'post',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
