// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_constructors

import 'dart:async';
import '/constants.dart';
import '/Mariam.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blinking_point/blinking_point.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNC Plots',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: kPrimaryColor
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final dbRef = FirebaseDatabase.instance.ref();



Future<void> WriteSquare() async{
    dbRef.child('label').update({
      'shape': 0
    });
  }
Future<void> Writetriangle() async{
    dbRef.child('label').update({
      'shape': 1
    });
  }


Future<void> WriteR() async{
    dbRef.child('label').update({
      'shape': 2
    });
  }
  
  Future<void> WriteH() async{
    dbRef.child('label').update({
      'shape': 3
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CNC Plots'),
        backgroundColor: Color.fromARGB(255, 151, 64, 145),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: dbRef.child('label').onValue,
          builder: (context, snapshot) {
            Widget imagewidget;
            if (snapshot.hasData &&
                !snapshot.hasError &&
                snapshot.data.snapshot.value != null) {
               return Container(
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 400,height: 35,),
                    GestureDetector(
              child:SvgPicture.asset("assets/square.svg", width: 100,
                height:100,),
              onTap: () {
                WriteSquare();},),
                const SizedBox(width: 400,height: 35,),
                    GestureDetector(
              child:SvgPicture.asset("assets/triangle.svg", width: 100,
                height:100,),
              onTap: () {
                Writetriangle();},),  
                  const SizedBox(width: 400,height: 20,),
                    GestureDetector(
              child:SvgPicture.asset("assets/rectangle.svg",
              width: 120,
                height:120, 
                ),
              onTap: () {
                WriteR();},),
                      const SizedBox(width: 400,height: 15,),
                    GestureDetector(
              child:SvgPicture.asset("assets/h.svg",
              width: 110,
                height:110, 
                ),
              onTap: () {
                WriteH();},),
                         const SizedBox(width: 400,height: 5,),
          FloatingActionButton.extended(
                   
        onPressed: () {
          
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Mariam()
                                )

                              );
        },
  
        label: const Text('دوس عليا'),
        icon: const Icon(Icons.girl),
        backgroundColor: Color.fromARGB(255, 213, 7, 76), ),],
                ),
                );
            } else {
              imagewidget = const Center(child: CircularProgressIndicator());
            }
            return imagewidget;
          }),
 
    );
  }
}

