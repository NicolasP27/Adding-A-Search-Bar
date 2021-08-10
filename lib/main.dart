import 'package:flutter/material.dart';
import 'package:skate_guide_cali_mk4/pages/home.dart';
import 'package:skate_guide_cali_mk4/pages/loading.dart';
import 'package:skate_guide_cali_mk4/pages/choose_skatepark.dart';

void  main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));