import 'package:flutter/material.dart';
import 'package:futsalwar/ui/booking_form.dart';
import 'package:futsalwar/bloc/logout_bloc.dart';
import 'package:futsalwar/ui/login_page.dart';
import 'package:futsalwar/ui/booking_page.dart';
import 'package:futsalwar/ui/lapangan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    HomeScreen(),
    JamBooking(),
    BookingPage(),
    // BookingPages._BookingPagesState(),
    // FavoriteScreen(),
    // AccountScreen()
  ];

  @override
  int _activeScreenIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeScreenIndex],

      //Tombol Booking
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

      //Navigasi Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeScreenIndex,
        onTap: (index) {
          setState(() {
            _activeScreenIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Jam Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking List',
          ),
        ],
      ),

      //side bar
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

//Widget Lapangan
Widget lapanganA() {
  return new Container(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.lightBlue[50],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Text('Lapangan A'),
        Text('Harga Rp. 160.000/Jam'),
        Text('Rumput Sintesis')
      ],
    ),
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    logoHome(),
                    SizedBox(height: 24.0),
                    LapanganA(),
                    SizedBox(height: 24.0),
                    LapanganB(),
                    SizedBox(height: 24.0),
                    // tombolNav()
                  ],
                ))),
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

class JamBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Favorite things!'),
      ),
    );
  }
}
