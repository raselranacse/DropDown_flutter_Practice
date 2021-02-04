import 'package:drop_down/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email, password;
//  register() async {
//    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//    final User user= (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
//    if(user!=null){
//      Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginScreen()));
//    }else{
//      print("error");
//    }
//  }


     signUp() async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: "barry.allen@example.com",
            password: "SuperSecretPassword!"
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(children: [SizedBox(height: 50.0),
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
              child: TextField(onChanged: (value){
                setState(() {
                  email=value;
                });
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
            SizedBox(height: 10.0),
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
              child: TextField(onChanged: (value){
                setState(() {
                  password=value;
                });
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
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: signUp,
              child: Text('Sign up'),
            ),
          ],),
        ),
      ),
    );
  }
}

