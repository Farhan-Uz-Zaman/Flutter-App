import 'package:flat/login.dart';
import 'package:flat/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget{
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate>{
  bool showLogIn = true;
  void toggleView(){
    setState(() => showLogIn = !showLogIn);
  }
  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomPadding: false;
    if(showLogIn){
      return Container(

        child: LoginPage(toggleView: toggleView),
      );
    }else{
      return Container(
        child: RegisterPage(toggleView: toggleView),
      );
    }

  }
}