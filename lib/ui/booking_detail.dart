import 'package:flutter/material.dart';
import 'package:futsalwar/bloc/booking_bloc.dart';
import 'package:futsalwar/model/booking.dart';
import 'package:futsalwar/ui/booking_form.dart';
import 'package:futsalwar/ui/booking_page.dart';
import 'package:futsalwar/widget/warning_dialog.dart';

// ignore: must_be_immutable
class BookingDetail extends StatefulWidget {
  Booking booking;
  BookingDetail({this.booking});
  @override
  _BookingDetailState createState() => _BookingDetailState();
} //end class BookingDetail

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Booking'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Nama : ${widget.booking.namaUser}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Alamat : ${widget.booking.alamatUser}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Jam : ${widget.booking.idJam}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Jadwal : ${widget.booking.tglJadwal}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Lapangan : ${widget.booking.idLapang}",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              "No Telepon : ${widget.booking.notelp}",
              style: TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  } //end Widget build

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //tombol edit
        ElevatedButton(
            child: Text("Edit"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => BookingForm(
                            booking: widget.booking,
                          )));
            }),
        ElevatedButton(
            child: Text("Delete"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () => confirmHapus())
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = new AlertDialog(
      content: Text("Yakin ingin menghapus data ini?"),
      actions: [
        //tombol hapus
        ElevatedButton(
          child: Text("Ya"),
          //cara ke-2 untuk mengganti color ElevatedButton
          // style: ElevatedButton.styleFrom(
          //   primary: Colors.green,
          //   onPrimary: Colors.white,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
          onPressed: () {
            BookingBloc.deleteBooking(id: widget.booking.id).then((value) {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => BookingPage()));
            }, onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext contetx) => WarningDialog(
                        description: "Hapus dats gagal, silahkan coba lagi",
                      ));
            });
          },
          //cara ke-2 untuk mengganti color ElevatedButton
          // style: ElevatedButton.styleFrom(
          //   primary: Colors.green,
          //   onPrimary: Colors.white,
        ),

        //tombol batal
        ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: Text("Batal")),
      ],
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
} //end class _BookingDetailState
