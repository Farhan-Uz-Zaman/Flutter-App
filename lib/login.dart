import 'dart:convert';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'home.dart';


class LoginPage extends StatefulWidget{
  final Function toggleView;
  LoginPage({this.toggleView});

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new Container(

          decoration: BoxDecoration(
              color: Colors.grey[850],
          ),
          child:ListView(
            children: <Widget>[
              headerSection(),
              textSection(),
              FlatButton.icon(onPressed: (){
                widget.toggleView();
              }, icon: Icon(Icons.account_circle,color: Colors.blueGrey,),
                  label: Text("Register", style: TextStyle(color: Colors.white))),
              buttonSection(),
            ],
          ),
        )
    );
  }
  signIn(String email,password) async{

  }
  Container buttonSection(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90.0,
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
          children: <Widget>[
       RaisedButton(
         padding: EdgeInsets.only( bottom: 10.0),
      onPressed: () async{
    if(_formKey.currentState.validate()){
    dynamic result = await _auth.signIn(email, password);
           if(result == null){
              setState(() {
                return error ="Could not Log In";
              });
            }
    }
    },
      color: Colors.blue[400],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Text("Sign In",style:TextStyle(color: Colors.white) ,),
    ),
    SizedBox(height: 12.0),
    Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0),)
      ],
    ),
    );
  }

  Container textSection(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
      margin: EdgeInsets.only(top: 25.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter Email" : null,
              onChanged: (val){
                setState(() =>email = val);
              },

              cursorColor: Colors.blue,
              style: TextStyle(color: Colors.blueAccent),
              decoration: InputDecoration(
                icon: Icon(Icons.email,color: Colors.blueGrey,),
                hintText: "Email",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    )
                ),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              validator: (val) => val.length<6 ? "Enter password with at least 6 chars" : null,
              onChanged: (val){
                setState(() =>password = val);
              },

              cursorColor: Colors.blue,
              obscureText: true,
              style: TextStyle(color: Colors.blueAccent),
              decoration: InputDecoration(
                icon: Icon(Icons.lock,color: Colors.blueGrey,),
                hintText: "Password",
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                ),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container headerSection(){
    return Container(child: SizedBox(
      child : Container(
        margin: EdgeInsets.symmetric(horizontal:40.0),
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 55.0),
        child: new Text("LOG IN",style: TextStyle(
            color: Colors.blue[400],fontSize: 60.0,fontWeight: FontWeight.bold ),),
      ),
    ),
    );
  }

}
