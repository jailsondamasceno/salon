import 'package:flutter/material.dart';
import 'package:my_style_client/models/User.dart';
import 'package:my_style_client/validators/LoginValidator.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _nameCoontroller = TextEditingController();
  TextEditingController _emailCoontroller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMensage = "";

  _regiserUser(){
    String name = _nameCoontroller.text;
    String email = _emailCoontroller.text;
    String password = _passwordController.text;
    User user = User();
    user.name = name;
    user.email = email;
    user.password = password;

    if(LoginValidator.validatorRegister(user)){
      var  userCreated =  LoginValidator.register(user);
      if(userCreated != null){
        Navigator.pushNamedAndRemoveUntil(context, "/services", (route) => false);
      }else{
        setState(() {
          _errorMensage = "Erro no registro, verifique os dados e tente novamente!";
        });
      }
    }else{
      setState(() {
        _errorMensage = "Verifique os campos!";
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background_login.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Image.asset(
                    "images/logo.png",
                    width: 300,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _nameCoontroller,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                        prefixIcon: IconButton(
                            icon: Icon(Icons.person), onPressed: null)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _emailCoontroller,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                        prefixIcon: IconButton(
                            icon: Icon(Icons.email), onPressed: null)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Senha",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                        prefixIcon: IconButton(
                            icon:Icon(Icons.lock)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                    onPressed: () {
                     _regiserUser();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffc30664),
                            Color(0xff930184),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints:
                            BoxConstraints(minWidth: 88.0, minHeight: 55.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Cadastrar',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: GestureDetector(
                      child: Text("Ir para login!",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _errorMensage,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20
                      ),
                    ),
                  ),
                )
              ],
            ))),
          )
        ],
      ),
    );
  }
}
