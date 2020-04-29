import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';



class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(237, 237, 237, 1.0),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent.shade200,
          title: Center(
            child: Text('Ghasak Store',
            style:  TextStyle(fontSize: 22 ,fontStyle: FontStyle.italic),),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock),
                text: "Login",
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Register',
              ),
            ],
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ///RegisterPage(),
            Login(),
            Register(),

          ],
        ),
      ),
    );
  }
}

//
//
//class SignInScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Text(PaintBallApp.sharedPreferences.get(PaintBallApp.userEmail)),
//    );
//  }
//}
