import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../provider/vehicle_provider.dart';
import 'list_of_mechanic.dart';
import 'nearby_mechanic.dart';

class SearchMechanic extends StatefulWidget {
  const SearchMechanic({Key? key}) : super(key: key);

  @override
  State<SearchMechanic> createState() => _SearchMechanicState();
}

class _SearchMechanicState extends State<SearchMechanic> {
  List<String> recentSearch = [];
  final searchQueryCtrl = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)  async {
      final pref = await SharedPreferences.getInstance();
      setState(() {
        recentSearch =  pref.getStringList('recentSearch') ?? [];
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffEBEBEB),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Consumer<VehicleProvider>(
            builder: (context, provider, child) {
              return Consumer<VehicleProvider>(
                builder: (context, provider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffF7F7F7),
                            borderRadius: BorderRadius.circular(29.5)),
                        child: TextField(
                          controller: searchQueryCtrl,
                          decoration: InputDecoration(
                              hintText: 'Search by location',
                              icon: GestureDetector(
                                  onTap: () async {
                                    SharedPreferences pref = await SharedPreferences.getInstance();
                                    setState(()  {
                                      recentSearch = pref.getStringList('recentSearch') ?? [];
                                      if(searchQueryCtrl.text.isNotEmpty) {
                                        recentSearch.add(searchQueryCtrl.text);
                                        provider.recentSearchLocations = searchQueryCtrl.text;
                                      }
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                          NearbyMechanic(location: searchQueryCtrl.text)));
                                    });

                                  },
                                  child: const Icon(Icons.search)),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      if (recentSearch.isNotEmpty)
                        const Text(
                          'Recent Searches',
                          style: TextStyle(
                              color: Color(0xff7E808A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                            children: List.generate(
                          recentSearch.length,
                          (index) => GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => NearbyMechanic(
                                        location: recentSearch[index]))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Image(
                                  image: AssetImage('assets/images/arroww.png'),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    recentSearch[index],
                                    style: const TextStyle(
                                        color: Color(0xff646464),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                      ),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
