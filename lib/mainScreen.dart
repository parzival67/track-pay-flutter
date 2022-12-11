// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:rive/rive.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white60,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage(
            //           'lib/assets/bgimage.png',
            //         ),
            //         fit: BoxFit.fitHeight)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: height * 1,
                  child: Column(
                    children: [
                      Text(
                        'PARIVARTHANA',
                        style: TextStyle(
                            fontSize: 70, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 5)
                            ]),
                        width: width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 15,
                            children: List.generate(75, (index) => HomeIcon()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeIcon extends StatefulWidget {
  const HomeIcon({super.key});

  @override
  State<HomeIcon> createState() => _HomeIconState();
}

class _HomeIconState extends State<HomeIcon> {
  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'lib/assets/anim.riv',
      stateMachines: ['State Machine 1'],
    );
  }
}
