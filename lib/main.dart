// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trackpay/mainScreen.dart';
import 'package:trackpay/mobileScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAq3SF0ocGmqoG2Ro8zKD23B0e7rXRYCqg",
          projectId: "trackpay-ce4b9",
          messagingSenderId: "602667751019",
          appId: "1:602667751019:web:618eaa6dcd7ef26abd832e",
          measurementId: "G-YFL14RQ0Y9"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: MyStatelessWidget());
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return MainScreen();
          } else {
            return MobileScreen();
          }
        },
      ),
    );
  }
}
