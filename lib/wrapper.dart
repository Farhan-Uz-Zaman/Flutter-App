import 'package:flat/users.dart';
import 'package:flutter/material.dart';
import 'package:flat/authenticate.dart';
import 'package:flat/home.dart';
import 'users.dart';
import 'home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomPadding: false;
    final user = Provider.of<User>(context);
    if(user ==null){
      return Authenticate();
    }else{
      return HomePage();
    }
    ;
  }
}