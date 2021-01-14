import 'dart:convert';

import 'package:convegno/login_page.dart';
import 'package:convegno/url_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String role;
  List roles = ['Teacher', 'Student'];

  bool lihatpass = true;

  lihatpassword() {
    setState(() {
      lihatpass = !lihatpass;
    });
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController passwdController = new TextEditingController();
  TextEditingController roleController = new TextEditingController();

  Future register() async {
      if (role == "Student") {
        final respon = await http.post(UrlAPI.register_user, body: {
          'nama' : nameController.text,
          'email' : emailController.text,
          'no_telp' : phoneController.text,
          'alamat' : addressController.text,
          'pass'  : passwdController.text
        });
        final hasil = jsonDecode(respon.body);
        bool status = hasil["error"];
        String pesan = hasil["message"];

        if (status == true){
          Alert(
            context: context,
            type: AlertType.error,
            title: "PERINGATAN",
            desc: pesan,
            buttons: [
              DialogButton(
                child: Text(
                  "OKE",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }else{
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
                onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage())),
                width: 120,
              )
            ],
          ).show();
        }

      } else {
        final respon = await http.post(UrlAPI.register_instructor, body: {
          'nama' : nameController.text,
          'email' : emailController.text,
          'no_telp' : phoneController.text,
          'alamat' : addressController.text,
          'pass'  : passwdController.text
        });
        final hasil = jsonDecode(respon.body);
        bool status = hasil["error"];
        String pesan = hasil["message"];

        if (status == true){
          Alert(
            context: context,
            type: AlertType.error,
            title: "PERINGATAN",
            desc: pesan,
            buttons: [
              DialogButton(
                child: Text(
                  "OKE",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }else{
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
                onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage())),
                width: 120,
              )
            ],
          ).show();
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      controller: nameController,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: 'Name',
        hintStyle: TextStyle(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final emailField = TextFormField(
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

    final phoneField = TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: 'Phone',
        hintStyle: TextStyle(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final addressField = TextFormField(
      controller: addressController,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_pin_circle),
        hintText: 'Address',
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

    final roleField = InputDecorator(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
        isDense: true,
        value: role,
        items: roles
            .map((value) => DropdownMenuItem(
                child: Text(value, style: TextStyle(fontSize: 15.0)),
                value: value))
            .toList(),
        onChanged: (value) {
          setState(() {
            role = value;
          });
        },
      )),
    );

    final loginButton = Container(
      height: 42.0,
      child: RaisedButton(
        color: Colors.blue[900],
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()));
        },
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
          register();
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
            padding: EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("SIGN UP", style: TextStyle(fontSize: 25)),
                Form(
                  child: Column(
                    children: [
                      SizedBox(height: 45.0),
                      nameField,
                      SizedBox(height: 15.0),
                      emailField,
                      SizedBox(height: 15.0),
                      phoneField,
                      SizedBox(height: 15.0),
                      addressField,
                      SizedBox(height: 15.0),
                      password,
                      SizedBox(height: 15.0),
                      roleField,
                      SizedBox(height: 25.0),
                      regisButton,
                      SizedBox(height: 15.0),
                      loginButton
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
