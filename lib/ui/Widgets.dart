import 'package:flutter/material.dart';

///Created on Android Studio Canary Version
///User: Gagandeep
///Date: 01-05-2019
///Time: 22:31
///Project Name: flutter_login_app



class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}

class LoginState extends State<Login>{

  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  var welcomeMessage = "Welcome User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.black,
      ),
      
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/aryn_wallpaper.jpg',
            ),

            //form
            Container(
//              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              height: 200.0,
              width: 380.0,
              child: ListView(  //To allow adding of more widgets without those "Warnings"/if substituted with column then warning wil occur
                children: <Widget>[
                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      icon: Icon(Icons.person)
                    ),
                  ),

                  TextField(
                    obscureText: true,
                    controller: _passController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Password',
                    ),
                  ),

                  Center(
                    child: Row(

                      children: <Widget>[
//                  Login Button
                        Container(
                         margin: EdgeInsets.all(16),
                          child: RaisedButton(
                            color: Colors.green,
                            child: Text ("Login"),
                            onPressed: () {
                              showWelcomeMessage();
                            },
                          ),
                        ),
//                  Password Button
                        Container(
                          margin: EdgeInsets.only(left: 94, right: 16, top: 16, bottom: 16),
                          child: RaisedButton(
                            color: Colors.redAccent,
                            child: Text ("Reset"),
                            onPressed: () {
                              clearTextBox();
                            },
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$welcomeMessage",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }

  void clearTextBox() {
    setState(() {
      _passController.clear();
      _userController.clear();
    });
  }

  void showWelcomeMessage() {
    setState(() {
      if (_userController.text.isEmpty) {
        welcomeMessage = "Enter Username !!";
      } else if (_passController.text.isEmpty) {
        welcomeMessage = "Enter password !!";
      } else {
        welcomeMessage = "Welcome ${_userController.text}~";
      }
    });
  }


}

