import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingscorer/Routes.dart';
import 'package:kingscorer/ui/home/HomePage.dart';

void main() {
 
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    Routes.initRoutes();
    runApp(new MaterialApp(
      title: 'GamerScorer',
      home: new HomePage(),
    ));
  });
}
