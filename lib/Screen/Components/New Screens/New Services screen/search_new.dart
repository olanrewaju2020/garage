import 'package:flutter/material.dart';

class SearchMechanic extends StatefulWidget {
  const SearchMechanic({Key? key}) : super(key: key);

  @override
  State<SearchMechanic> createState() => _SearchMechanicState();
}

class _SearchMechanicState extends State<SearchMechanic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: 20,
        ),
        elevation: 0,
        backgroundColor: Color(0xffEBEBEB),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(29.5)),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Search by location   ',
                      icon: Icon(Icons.search),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text('Recent Searches', style: TextStyle(
                color: Color(0xff7E808A),
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/arroww.png'),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text('Abeokuta, Ogun State', style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/arroww.png'),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text('Sagamu, Ogun State ', style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/arroww.png'),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text('Ibadan, Oyo State ', style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/arroww.png'),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text('Ibadan, Oyo State ', style: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
