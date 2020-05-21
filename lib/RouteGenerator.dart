import 'package:flutter/material.dart';
import 'package:my_style_client/screens/Login.dart';
import 'package:my_style_client/screens/Register.dart';
import 'package:my_style_client/screens/ServiceDetail.dart';
import 'package:my_style_client/screens/Services.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Login());
        break;

      case "/login":
        return MaterialPageRoute(builder: (_) => Login());
        break;

      case "/register":
        return MaterialPageRoute(builder: (_) => Register());
        break;

      case "/services":
        return MaterialPageRoute(builder: (_) => Services());

      default:
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada!"),
        ),
        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }
}
