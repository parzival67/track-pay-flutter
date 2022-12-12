// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, unused_import, sort_child_properties_last

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:rive/rive.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MainScreenState();
}

int amount = 0;
List<int> glowUps = [];

class _MainScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    FireStoreDataBase().getData();

    List dataList;

    return Scaffold(
      backgroundColor: Colors.white60,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height,
                  child: RiveAnimation.asset(
                    'lib/assets/anim.riv',
                    artboard: 'bgScreen',
                    stateMachines: ['State Machine 1'],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Container(
                    width: double.infinity,
                    //height: height * 1,
                    child: Column(
                      children: [
                        Container(
                          //height: height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      height: height * 0.07,
                                      child: Image.asset(
                                          'lib/assets/revaUniversity.png')),
                                  Text(
                                    'School of Electrical & Electronics Engineering',
                                    style: TextStyle(
                                        fontFamily: 'RobotoSlab',
                                        color: Colors.black,
                                        fontSize: height * 0.025,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white,
                                                  spreadRadius: 5,
                                                  blurRadius: 10)
                                            ]),
                                        child: SizedBox(
                                            height: width * 0.1,
                                            child: Image.asset(
                                                'lib/assets/clubLogo.png')),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Social Outreach Club',
                                        style: TextStyle(
                                            fontFamily: 'RobotoSlab',
                                            color: Colors.black,
                                            fontSize: height * 0.035,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white,
                                                  spreadRadius: 5,
                                                  blurRadius: 10)
                                            ]),
                                        child: SizedBox(
                                            height: width * 0.1,
                                            child: Image.asset(
                                                'lib/assets/clubLogo.png')),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.07,
                                  ),
                                  Text(
                                    'PARIVARTHAN',
                                    style: TextStyle(
                                        fontFamily: 'RobotoSlab',
                                        color: Colors.lightBlue,
                                        fontSize: height * 0.06,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 5),
                                  ),
                                  Text(
                                    '"Donate to Illuminate"',
                                    style: TextStyle(
                                        fontFamily: 'RobotoSlab',
                                        color: Colors.lightBlue,
                                        fontSize: height * 0.03,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              FutureBuilder(
                                future: FireStoreDataBase().getData(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text(
                                      "Something went wrong",
                                    );
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    dataList = snapshot.data as List;
                                    amount = dataList[0]['amount'];
                                    glowUps = func1(amount);

                                    return Column(
                                      children: [
                                        Container(
                                          //height: height * 0.2,
                                          width: width * 0.7,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Rs. $amount',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'RobotoSlab',
                                                        color: Colors.lightBlue,
                                                        fontSize: height * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Total Donated amount',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'RobotoSlab',
                                                        color: Colors.black,
                                                        fontSize: height * 0.02,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    '${amount ~/ 400}',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'RobotoSlab',
                                                        color: Colors.lightBlue,
                                                        fontSize: height * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Houses Illuminated',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'RobotoSlab',
                                                        color: Colors.black,
                                                        fontSize: height * 0.02,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(20)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    blurRadius: 10,
                                                    spreadRadius: 5)
                                              ]),
                                          width: width * 0.9,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: GridView.count(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              crossAxisCount: 10,
                                              children: List.generate(
                                                  75,
                                                  (index) => homeIcon(
                                                      glowUps.contains(index))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 20, 15),
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: height * 0.25,
                                      child: Image.asset(
                                          'lib/assets/havellsLight.png')),
                                  Container(
                                    width: width * 0.45,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Havells Glanz \n1.5-Watt Rechargeable Solar Light',
                                          style: TextStyle(
                                              fontFamily: 'RobotoSlab',
                                              color: Colors.black,
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Rs. 409',
                                          style: TextStyle(
                                              fontFamily: 'RobotoSlab',
                                              color: Colors.black,
                                              fontSize: height * 0.03,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'This Rechargeable Solar Light will be donated out to the homes in order to achieve a self-sufficient Light source',
                                          style: TextStyle(
                                              fontFamily: 'RobotoSlab',
                                              color: Colors.black,
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 20, 15),
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: height * 0.2,
                                      child:
                                          Image.asset('lib/assets/bulb.png')),
                                  Container(
                                    //width: width * 0.45,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rechargeable Solar Light',
                                          style: TextStyle(
                                              fontFamily: 'RobotoSlab',
                                              color: Colors.black,
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Rs. 150',
                                          style: TextStyle(
                                              fontFamily: 'RobotoSlab',
                                              color: Colors.black,
                                              fontSize: height * 0.03,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Scan to Donate',
                                  style: TextStyle(
                                      fontFamily: 'RobotoSlab',
                                      color: Colors.black,
                                      fontSize: height * 0.03,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: width * 0.5,
                                  width: width * 0.5,
                                  child: Image.asset('lib/assets/upiQR.jpg'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '8792470049@ybl',
                                  style: TextStyle(
                                      fontFamily: 'RobotoSlab',
                                      color: Colors.black,
                                      fontSize: height * 0.03,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget homeIcon(glow) {
  String x = '';
  if (glow) {
    x = 'State Machine 1';
  } else {
    x = 'State Machine x';
  }
  return HoverWidget(
    child: Transform.scale(
      scale: 1,
      child: RiveAnimation.asset(
        'lib/assets/anim.riv',
        stateMachines: [x],
      ),
    ),
    hoverChild: Transform.scale(
      scale: 0.8,
      child: RiveAnimation.asset(
        'lib/assets/anim.riv',
        stateMachines: [x],
      ),
    ),
    onHover: (event) {},
  );
}

class FireStoreDataBase {
  List studentsList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("totalCollection");

  Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          studentsList.add(result.data());
        }
      });
      return studentsList;
    } catch (e) {
      debugPrint("Error - $e");
      return e;
    }
  }
}

List<int> func(am) {
  int cost = 400;
  int bulbs = am ~/ cost;
  Set<int> x = {};
  Random random = Random();

  while (x.length != bulbs) {
    int randomNumber = random.nextInt(75);
    x.add(randomNumber);
  }
  return x.toList();
}

List<int> func1(am) {
  int cost = 400;
  int bulbs = am ~/ cost;

  List<int> a = List.generate(bulbs, (index) => index);
  return a;
}
