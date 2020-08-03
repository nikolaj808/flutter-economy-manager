import 'package:flutter/material.dart';
import 'package:economy_manager/pages/home_page.dart';
import 'package:economy_manager/pages/account_page.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/account': (context) => Account(),
  },
));
