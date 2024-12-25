import 'package:flutter/material.dart';


void main(){
  runApp(BtakatiApp());
}

class BtakatiApp extends StatelessWidget {
  const BtakatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/mamdouh.jpg"),
                radius: 50,
              ),
              SizedBox(height: 10),
              Text("Mamdouh Sobhy",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "tajawal",fontWeight: FontWeight.bold),),
              Text("mamdouhsobhy923@gmail.com",style: TextStyle(color: Colors.white,fontFamily: "tajawal",fontSize: 14)),
              SizedBox(height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.phone,color: Colors.red,),
                  title: Text("+201094903199",style: TextStyle(color: Colors.black,fontSize: 15),),
                ),
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child:  ListTile(
                  leading: Icon(Icons.mail,color: Colors.red,),
                  title: Text("mamdouhsobhy923@gmail.com",style: TextStyle(color: Colors.black,fontSize: 15),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
