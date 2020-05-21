import 'package:flutter/material.dart';
import 'package:my_style_client/validators/LoginValidator.dart';

class MenuIcon extends StatelessWidget {

  final IconData icon;
  final String title;
  final String route;

  MenuIcon(this.icon, this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          LoginValidator.logout(context, route);
        },
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32,
                color: Colors.black,
              ),
              SizedBox(width: 32,),
              Text(title, style: TextStyle(fontSize: 16, color: Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}
