import 'package:flat/auth.dart';
import 'package:flutter/material.dart';
import 'package:flat/login.dart';

class HomePage extends StatefulWidget{
    @override
  State<StatefulWidget> createState() => new _HomePageState();
}
class _HomePageState extends State<HomePage>{
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text("Liton Er Flat", style: TextStyle(fontFamily: 'Pacifico',color: Colors.white),
        ),
        actions:<Widget>[
                    FlatButton.icon(
            onPressed: () async{
              await _auth.signOut();
            },
            icon: Icon(Icons.person,color: Colors.white),
            label:Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),



      body:
      ListView(
        children: <Widget>[
          padding1("images/ub1.jpg", "3 bedroom flat", "Mirpur","4"),
          padding1("images/ub2.jpg", "3 bedroom flat","Gulshan-1","5"),
          padding1("images/ub4.jpg", "1500 SQFT flat", "Uttara","4"),
          padding1("images/ub3.jpg", "2200 SQFT flat", "Banani","5")
        ],
      ),
    );
  }
  Padding padding1(String img, String data, String address, String num){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.blueAccent[100],
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Colors.blueGrey[600],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: myDetailsContainer1(data,address,num),
                    ),
                  ),

                  Container(
                    width: 250,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: AssetImage(img),
                      ),
                    ),),
                ],)
          ),
        ),
      ),
    );
  }
  Row star(var i) {
    List<Container> list = new List<Container>();
    for(var j=0;j<i;j++){
      list.add(new Container(child: Icon(
        Icons.star, color: Colors.amber,
        size: 15.0,),
      ));
    }
    return Row(children: list);
  }

  Widget myDetailsContainer1(String name, String address, String num) {
    var nnum = int.parse(num);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text(name,
            style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text(num,
                    style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                  Container(
                    child: star(nnum),


                  ),

                  Container(child: Text("(321) \u00B7 0.9 mi",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                ],)),
        ),
        Container(child: Text(address,
          style: TextStyle(color: Colors.black54, fontSize: 18.0,fontWeight: FontWeight.bold),),),
      ],
    );
  }
}