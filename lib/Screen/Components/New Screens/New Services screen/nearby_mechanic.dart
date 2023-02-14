import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NearbyMechanic extends StatefulWidget {
  const NearbyMechanic({Key? key}) : super(key: key);

  @override
  State<NearbyMechanic> createState() => _NearbyMechanicState();
}

class _NearbyMechanicState extends State<NearbyMechanic> {
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Result',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff21B24B)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Mechanics near you',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff282828)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 15),
                          decoration: BoxDecoration(
                            color: Color(0xffE9F5F5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/images/hat1.png'),
                                width: 150,
                              ),
                              Center(
                                child: Text(
                                  'Shola Fatoki',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xff282828)),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Somorin',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Color(0xff282828)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 15),
                          decoration: BoxDecoration(
                            color: Color(0xffE9F5F5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/images/hat2.png'),
                                width: 150,
                              ),
                              Center(
                                child: Text(
                                  'Shola Fatoki',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xff282828)),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Somorin',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Color(0xff282828)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 15),
                          decoration: BoxDecoration(
                            color: Color(0xffE9F5F5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/images/hat1.png'),
                                width: 150,
                              ),
                              Center(
                                child: Text(
                                  'Shola Fatoki',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xff282828)),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Somorin',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Color(0xff282828)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Other results in Abeokuta', style: TextStyle(
                color: Color(0xff282828),
                fontWeight: FontWeight.w500,
                fontSize: 15
              ),),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 95,
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xff21B24B),
                  ),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('assets/images/woman.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dimeji Akintola',
                            style: TextStyle(
                                color: Color(0xff0D0221),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Kemta, Abeokuta',
                            style: TextStyle(
                                color: Color(0xff282828),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 95,
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xff21B24B),
                  ),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('assets/images/woman.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dimeji Akintola',
                            style: TextStyle(
                                color: Color(0xff0D0221),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Kemta, Abeokuta',
                            style: TextStyle(
                                color: Color(0xff282828),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 95,
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xff21B24B),
                  ),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('assets/images/woman.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dimeji Akintola',
                            style: TextStyle(
                                color: Color(0xff0D0221),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Kemta, Abeokuta',
                            style: TextStyle(
                                color: Color(0xff282828),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
