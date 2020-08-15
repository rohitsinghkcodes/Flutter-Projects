import 'package:flutter/material.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/rohit.png'),
              ),
              Text(
                'Rohit Singh',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                'APPLICATION DEVELOPER\nAndroid + IOS',
                style: TextStyle(
                  color: Colors.blue[100],
                  fontSize: 16.0,
                  fontFamily: 'SansPro',
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.blue[100],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    title: Text(
                      '+91 9455857658',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontFamily: 'SansPro',
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'rohitkumarsingh@gmail.com',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontFamily: 'SansPro',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
