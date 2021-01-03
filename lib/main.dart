//import package 
import 'package:convegno/login_page.dart'; 
import 'package:convegno/splash_screen.dart'; 
import 'package:flutter/material.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Nama Aplikasi",
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.title,  //tampilan awal yang akan ditampilkan pada MaterialApp yaitu SplashScreen
        routes: {
          LoginPage.title: (context) => LoginPage(),
          SplashScreen.title: (context) => SplashScreen()
        });
  }
}
