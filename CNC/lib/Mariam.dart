// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_constructors

import 'dart:async';
import '/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blinking_point/blinking_point.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const Mariam());
}

class Mariam extends StatelessWidget {
  const Mariam({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNC Plots',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: kPrimaryColor
      ),
      home: const MariamPage(),
    );
  }
}

class MariamPage extends StatefulWidget {
  const MariamPage({Key key}) : super(key: key);

  @override
  State<MariamPage> createState() => _MariamPageState();
}

class _MariamPageState extends State<MariamPage> {

  final dbRef = FirebaseDatabase.instance.ref();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CNC Plots'),
        backgroundColor: Color.fromARGB(255, 151, 64, 145),
        centerTitle: true,
      ),
  
               body: Container(
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 400,height:100,),
                   Column(
  children: [
    Image.asset('assets/Mariam.png'), // <-- SEE HERE
    const SizedBox(width: 400,height:100,),
     const Text("بتدوس عليا ليه يا مفترى"),
  ],
)
           
  

      ]),
 
     ) );
  }
}

