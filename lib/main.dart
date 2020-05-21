import 'package:flutter/material.dart';
import 'package:my_style_client/screens/Login.dart';
import 'dart:io';
import 'RouteGenerator.dart';


final ThemeData temaIOS = ThemeData(
    primaryColor: Color(0xffc30664),
    accentColor: Color(0xff930184)
);

final ThemeData temaPadrao = ThemeData(
  primaryColor: Color(0xffc30664),
  accentColor: Color(0xff930184),
);

void main() => runApp(
  MaterialApp(
    home: Login(),
    theme: Platform.isIOS ? temaIOS : temaPadrao,
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,
    debugShowCheckedModeBanner: false,
  )
);
