import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Sidebar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CONVEGNO PROFILE"),
        backgroundColor: Colors.blue[800],
      ),
      body: new ListView(
        padding: new EdgeInsets.all(20),
        children: <Widget>[
          new Image(
            image: new NetworkImage(
                "https://c.pxhere.com/images/0d/18/4fa31701d2cfa087836d807967f3-1447663.jpg!d"),
            width: 30,
          ),
          new ListTile(
            leading: new Icon(Icons.emoji_people_rounded),
            title: new Text("Bastian Rizki"),
          ),
          new ListTile(
            leading: new Icon(Icons.supervised_user_circle),
            title: new Text("bastianrizki"),
          ),
          new ListTile(
            leading: new Icon(Icons.email_rounded),
            title: new Text("bastian112@gmail.com"),
          ),
          new ListTile(
            leading: new Icon(Icons.phone_callback_rounded),
            title: new Text("+62 82277777807"),
          ),
          new ListTile(
            leading: new Icon(Icons.lock_rounded),
            title: new Text("*********"),
          ),
          new ListTile(
            leading: new Icon(Icons.location_city_rounded),
            title: new Text("Banda Aceh"),
          ),
          new ListTile(
            leading: new Icon(Icons.people_alt_rounded),
            title: new Text("Male"),
          ),
        ],
      ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Bastian Rizki"),
            accountEmail: new Text("bastian112@gmail.com"),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  "https://c.pxhere.com/images/0d/18/4fa31701d2cfa087836d807967f3-1447663.jpg!d"),
            ),
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new NetworkImage(
                        "https://cdn.cjr.org/wp-content/uploads/2019/07/AdobeStock_100000042-e1563305717660-686x371.jpeg"),
                    fit: BoxFit.cover)),
          ),
          new ListTile(
            title: new Text("Profile"),
            trailing: new Icon(Icons.verified_user),
          ),
          new ListTile(
            title: new Text("About Apps"),
            trailing: new Icon(Icons.settings),
          ),
          new ListTile(
            title: new Text("Sign Out"),
            trailing: new Icon(Icons.logout),
          ),
        ],
      )),
    );
  }
}
