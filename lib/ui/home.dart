import 'package:flutter/material.dart';
import 'package:futsalwar/ui/booking_form.dart';
import 'package:futsalwar/bloc/logout_bloc.dart';
import 'package:futsalwar/ui/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        icon: const Icon(Icons.book_online),
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Jam Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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
