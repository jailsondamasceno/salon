import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_style_client/models/User.dart';

class LoginValidator {

  static verifyUserLogged(context, newRoute) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    var userLogged = await auth.currentUser();
    if(userLogged != null){
      Navigator.pushNamedAndRemoveUntil(context, "$newRoute", (route) => false);
    }else{
      return;
    }
  }

  static validatorRegister(User user) {
    if (user.email != null && user.email != "" && user.email.contains("@")) {
      return true;
    }
    return false;
  }

  static validatorLogin(User user) {
    if (user.email != null && user.email != "" && user.email.contains("@")) {
      if (user.password != null &&
          user.password != "" &&
          user.password.length >= 6) {
        return true;
      }
    }
    return false;
  }

  static login(user) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var logged = await auth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
        var userLogged = logged.user;
    return userLogged;
  }

  static register(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    Firestore db = Firestore.instance;

    var created = await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
        if(created.user != null){
          user.password = null;
          db.collection('users').document(created.user.uid).setData(user.toMap());
        }
        var userCreated = created.user;
    return userCreated;
  }


  static logout(context, newRoute)  {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, "$newRoute", (route) => false);
  }

}
