import 'package:futsalwar/bloc/jam_bloc.dart';
import 'package:futsalwar/model/jam.dart';
import 'package:flutter/material.dart';

class JamPage extends StatefulWidget {
  @override
  _JamPagesState createState() => _JamPagesState();
}

//
// File ini digunakan untuk menampilkan Booking
//
class _JamPagesState extends State<JamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer logout
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Text(
            'Daftar Jam Booking',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List>(
        future: JamBloc.getJam(),
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
    );
  } //end Widget
}

class DaftarJam extends StatelessWidget {
  final JamModel jam;
  DaftarJam({this.jam});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Card(
          child: ListTile(
            title: Text(jam.ket_jam.toString()),
          ),
        ),
      ),
    );
  }
} // end class DaftarJam

class ListBooking extends StatelessWidget {
  final List list;
  ListBooking({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return DaftarJam(
            jam: list[i],
          );
        });
  }
}
