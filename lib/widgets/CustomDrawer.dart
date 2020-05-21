import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_style_client/widgets/MenuIcon.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 16),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: GestureDetector(
                              child: CircleAvatar(
                                maxRadius: 40,
                                backgroundColor: Colors.grey,
                                backgroundImage: null,
                              ),
                            )
                          ),
                          Center(
                            child: Text("Jailson Jarvis",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(23, 37, 44, 0.5))),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              MenuIcon(Icons.call_received, "sair", "/login"),
              MenuIcon(Icons.settings, "Configurações", "/configuracoes"),
              MenuIcon(Icons.store, "Serviços", "/servicos"),
              MenuIcon(Icons.shopping_cart, "Meus Pedidos", "/servicos")
            ],
          )
        ],
      ),
    );
  }
}
