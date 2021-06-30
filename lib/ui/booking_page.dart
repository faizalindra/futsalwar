import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:futsalwar/bloc/logout_bloc.dart';
import 'package:futsalwar/bloc/booking_bloc.dart';
import 'package:futsalwar/model/booking.dart';
import 'package:futsalwar/ui/login_page.dart';
import 'package:futsalwar/ui/booking_detail.dart';
import 'package:futsalwar/ui/booking_form.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPagesState createState() => _BookingPagesState();
}

//
// File ini digunakan untuk menampilkan Booking
//
class _BookingPagesState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Booking'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: Icon(Icons.add, size: 26.0),
              onTap: () async {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => BookingForm()));
              },
            ),
          )
        ],
      ),

      //drawer logout
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
      body: FutureBuilder<List>(
        future: BookingBloc.getBookings(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListBooking(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      // body: ListView(
      //   children: [
      //     ItemBooking(
      //         booking: Booking(
      //             id: 1,
      //             kodeBooking: 'A001',
      //             namaBooking: 'HP Laptop',
      //             hargaBooking: 6700000)),
      //     ItemBooking(
      //         booking: Booking(
      //             id: 1,
      //             kodeBooking: 'A002',
      //             namaBooking: 'Asus Laptop',
      //             hargaBooking: 7700000)),
      //     ItemBooking(
      //         booking: Booking(
      //             id: 1,
      //             kodeBooking: 'A003',
      //             namaBooking: 'Lenovo Laptop',
      //             hargaBooking: 5700000)),
      //   ],
      // ),
    );
  } //end Widget
} // end class _bookingPages State

class ItemBooking extends StatelessWidget {
  final Booking booking;
  ItemBooking({this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => BookingDetail(
                        booking: booking,
                      )));
        },
        child: Card(
          child: ListTile(
            title: Text(booking.namaUser.toString()),
            subtitle: Text(booking.idJam.toString()),
          ),
        ),
      ),
    );
  }
} // end class ItemBooking

class ListBooking extends StatelessWidget {
  final List list;
  ListBooking({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return ItemBooking(
            booking: list[i],
          );
        });
  }
}
