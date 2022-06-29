import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/location.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[900], // status bar color
  ));
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/location':(context)=>Location(),
      '/home':(context)=>Home(),
    },
  ));
}


