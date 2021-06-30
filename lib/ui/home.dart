import 'package:flutter/material.dart';
import 'package:futsalwar/ui/booking_form.dart';
import 'package:futsalwar/bloc/logout_bloc.dart';
import 'package:futsalwar/ui/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Floating Action Button Label'),
      // ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    logoHome(),
                    SizedBox(height: 24.0),
                    SizedBox(height: 24.0),
                    SizedBox(height: 24.0),
                    // tombolNav()
                  ],
                ))),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => BookingForm()));
          // Add your onPressed code here!
        },
        label: const Text('Booking'),
        backgroundColor: Colors.pink,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.logout),
              onTap: () async {
                await LogoutBloc.logout().then((value) {
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget logoHome() {
  return new Container(
    child: new Center(
        child: new Column(
      children: [
        new Padding(
          padding: new EdgeInsets.all(20.0),
        ),
        new Padding(
          padding: new EdgeInsets.all(20.0),
        ),
        new Image.asset(
          "img/futsalwar.png",
          width: 300.0,
        )
      ],
    )),
  );
}

Widget tombolNav() {
  return Row(
    children: [],
  );
}
