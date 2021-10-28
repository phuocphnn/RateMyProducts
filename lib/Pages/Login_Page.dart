// ignore_for_file: file_names, prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void checkInput() {
    if (username.text == 'adc' && password.text == '123') {
      Navigator.pushNamed(context, '/MainPage');
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: Text(
                    'Login fail! Please check your username and password!'));
          });
    }
  }

  var username = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'RateMyProducts.com',
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'img/icon.png',
                height: 200,
              ),
              SizedBox(height: 10),
              Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                  ),
                  hintText: "Please enter your username",
                  labelText: "User Name",
                ),
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: "Please enter your password",
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  checkInput();
                },
                child: Text(
                  "login",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
