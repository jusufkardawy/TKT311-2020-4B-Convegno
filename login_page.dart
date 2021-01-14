import 'dart:convert';

import 'package:convegno/instructor_page.dart';
import 'package:convegno/register_page.dart';
import 'package:convegno/url_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import 'student_page.dart';
import 'student_page.dart';

class LoginPage extends StatefulWidget {
  static const String title = "login_page";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwdController = new TextEditingController();

  bool lihatpass = true;

  lihatpassword() {
    setState(() {
      lihatpass = !lihatpass;
    });
  }

  Future Login() async {
    final respon = await http.post(UrlAPI.login, body: {
      'email': emailController.text,
      'pass': passwdController.text,
    });
    final hasil = jsonDecode(respon.body);

    bool status = hasil['error'];
    String pesan = hasil['message'];
    String page = hasil ['page'];

    var student = StudentPage();
    var instructor = InstructorPage();
    var pages;

    if (page == "student") {
      pages = student;
    } else {
      pages = instructor;
    }




    if (status == true) {
      Alert(
          context: context,
          type: AlertType.error,
          title: "PERINGATAN",
          desc: pesan,
          buttons: [
            DialogButton(
              child: Text("oke"),
              onPressed: () => Navigator.pop(context),
              width: 120.0,
            )
          ]
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.info,
        title: "INFORMASI",
        desc: pesan,
        buttons: [
          DialogButton(
            child: Text(
              "OKE",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>(pages))),
            width: 120,
          )
        ],
      ).show();
    }
  }
  @override

  Widget build(BuildContext context) {
  
    final email = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'Email',
        hintStyle: TextStyle(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: passwdController,
      autofocus: false,
      obscureText: lihatpass,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'Password',
        hintStyle: TextStyle(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        suffixIcon: new IconButton(
          icon: new Icon(
            lihatpass ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye
            , color: Colors.black45,
            size: 20,),
          onPressed: () {
            lihatpassword();
          },
        ),
      ),
    );

    final loginButton = Container(
      height: 42.0,
      child: RaisedButton(
        color: Colors.blue[900],
        onPressed: () {Login();},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        padding: EdgeInsets.all(0.0),
        child: Container(
          constraints: BoxConstraints(maxWidth: 250.0, minHeight: 42.0),
          alignment: Alignment.center,
          child: Text("SIGN IN", style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final regisButton = Container(
      height: 42.0,
      child: RaisedButton(
        color: Colors.blue[900],
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        padding: EdgeInsets.all(0.0),
        child: Container(
          constraints: BoxConstraints(maxWidth: 250.0, minHeight: 42.0),
          alignment: Alignment.center,
          child: Text("SIGN UP", style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("SIGN IN", style: TextStyle(fontSize: 25)),
                Form(
                  child: Column(
                    children: [
                      SizedBox(height: 45.0),
                      email,
                      SizedBox(height: 15.0),
                      password,
                      SizedBox(height: 25.0),
                      loginButton,
                      SizedBox(height: 15.0),
                      regisButton
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
