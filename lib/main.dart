import 'package:flutter/material.dart';
import 'package:ratemyfood/Pages/Login_Page.dart';

import 'Pages/Carousel_Page.dart';
import 'Pages/Home_Page.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/MainPage': (context) => HomePage(),
        '/Sliderr': (context) => Sliderr(),
      },
    ));
