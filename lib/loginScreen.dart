import 'package:drop_down/ProfileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  LogIn() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final User user = (await firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password )).user;
    if(user !=null){
      Navigator.push(context, CupertinoPageRoute(builder: (context)=>ProfileScreen()));
    }else{
      print("error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10.0,
                  offset: Offset(0.0,10.0)
              )
            ],
          ),
          child: TextField(onChanged: (val){
            _email=val;
          },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                labelText: "Enter Email",
                labelStyle: TextStyle(fontStyle: FontStyle.italic),
                filled: true,
                fillColor: Colors.grey[200]
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10.0,
                  offset: Offset(0.0,10.0)
              )
            ],
          ),
          child: TextField(onChanged: (val){
            _password=val;
          },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                labelText: "Enter Password",
                labelStyle: TextStyle(fontStyle: FontStyle.italic),
                filled: true,
                fillColor: Colors.grey[200]
            ),
          ),
        ),
        RaisedButton(onPressed: LogIn,
          child: Text('Sign in'),
        ),
      ],),
    );
  }
}
