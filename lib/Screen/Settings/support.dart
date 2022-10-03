import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF7F7FA),
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.green,
              size: 15,
            ),
          ),
          title: Text(
            'Support',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal),
          ),
          centerTitle: true,
          elevation: 0.3,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 65,
              ),
              Center(
                  child: Icon(
                Icons.headset_mic,
                size: 100,
                color: Colors.green,
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                'How can we help \nyou?',
                style: TextStyle(
                    fontFamily: "manrope",
                    height: 1.3,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.messenger_outline, color: Colors.green,),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Connect Live Chat', style: TextStyle(
                          color: Colors.black,

                        ),)
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    Text(
                      'Send us an email',
                      style: TextStyle(
                          fontFamily: "manrope",
                          color: Colors.grey[400],
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'mobilita@company.org',
                      style: TextStyle(
                          fontFamily: "manrope",
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
