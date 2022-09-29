import 'package:flutter/material.dart';

class Inspection extends StatefulWidget {
  const Inspection({Key? key}) : super(key: key);

  @override
  State<Inspection> createState() => _InspectionState();
}

class _InspectionState extends State<Inspection> {
  @override
  var _currentStep = 0;
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xfff4f4f2),
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
            'Vehicle Repair',
            style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal),
          ),
          centerTitle: true,
          elevation: 0.3,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.green,
              labelColor: Color(0xff180352),
              unselectedLabelColor: Color(0xff000000),
              indicatorWeight: 2,
              tabs: [
                Tab(
                  text: 'REQUEST',
                ),
                Tab(
                  text: 'SELECT DATE',
                ),
                Tab(
                  text: 'CHECKOUT',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        autofocus: false,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name of contact person',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        autofocus: false,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Present vehicle location',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        autofocus: false,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Number of contact person',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        autofocus: false,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Where should we meet you',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 28.0),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (context) => new Dashboard()));
                              },
                              child: Text(
                                'Proceed',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: TextField(
                        autofocus: false,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Date',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     new MaterialPageRoute(
                              //         builder: (context) => new Dashboard()));
                            },
                            child: Text(
                              'Proceed',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 1,
                                  offset: Offset(0, 0))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Text(
                                  'Review Charges',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Reg No: AH13HY',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Oil change',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Oil filter',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'VAT (7.5%)',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    'N562',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sub Total',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '26,000',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '26,N562',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total order',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '10,750',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     new MaterialPageRoute(
                              //         builder: (context) => new Dashboard()));
                            },
                            child: Text(
                              'Pay now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
