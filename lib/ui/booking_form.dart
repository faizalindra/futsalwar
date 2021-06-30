import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futsalwar/bloc/booking_bloc.dart';
import 'package:futsalwar/model/booking.dart';
import 'package:futsalwar/ui/booking_page.dart';
import 'package:futsalwar/widget/warning_dialog.dart';

// ignore: must_be_immutable
class BookingForm extends StatefulWidget {
  Booking booking;
  BookingForm({this.booking});
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Booking";
  String tombolSubmit = "Simpan";

  final _namaBookingTextboxController = TextEditingController();
  final _alamatBookingTextboxController = TextEditingController();
  final _jamBookingTextboxController = TextEditingController();
  final _jadwalBookingTextboxController = TextEditingController();
  final _lapangBookingTextboxController = TextEditingController();
  final _notelpBookingTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  } //end initState

  //untuk menyimpan data
  isUpdate() {
    if (widget.booking != null) {
      setState(() {
        judul = "Ubah Booking";
        tombolSubmit = "Ubah";
        _namaBookingTextboxController.text = widget.booking.namaUser;
        _alamatBookingTextboxController.text = widget.booking.alamatUser;
        _jamBookingTextboxController.text = widget.booking.alamatUser;
        _jadwalBookingTextboxController.text = widget.booking.alamatUser;
        _lapangBookingTextboxController.text = widget.booking.alamatUser;
        _notelpBookingTextboxController.text = widget.booking.notelp.toString();
      });
    } else {
      judul = "Tambah Booking";
      tombolSubmit = "Simpan";
    }
  } //end isUpdate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _namaBookingTextField(),
                    _alamatBookingTextField(),
                    _jamBookingTextField(),
                    _jadwalBookingTextField(),
                    _lapangBookingTextField(),
                    _notelpBookingTextField(),
                    _buttonSubmit()
                  ],
                )),
          ),
        ),
      ),
    );
  }

  //membuat textbox nama booking
  Widget _namaBookingTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nama"),
      keyboardType: TextInputType.text,
      controller: _namaBookingTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Nama Booking harus diisi";
        }
        return null;
      },
    );
  }

  //textbox alamat user
  Widget _alamatBookingTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Alamat"),
      keyboardType: TextInputType.text,
      controller: _alamatBookingTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Alamat Booking harus diisi";
        }
        return null;
      },
    );
  }

  //textbox jam
  Widget _jamBookingTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Jam (yy-mm-dd)"),
      keyboardType: TextInputType.text,
      controller: _jamBookingTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Atur Jadwal Booking!!";
        }
        return null;
      },
    );
  }

  Widget _jadwalBookingTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nama"),
      keyboardType: TextInputType.datetime,
      controller: _jadwalBookingTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Pilih Jadwal!!";
        }
        return null;
      },
    );
  } //end Widget _kodeBookingTextFIeld

  //membuat textbox lapangan
  Widget _lapangBookingTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Pilih Lapangan (A/B)"),
      keyboardType: TextInputType.text,
      controller: _lapangBookingTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Pilih Lapangan!!";
        }
        return null;
      },
    );
  } //end Widget _namaBookingTextFIeld

  //membuat textbox notelp
  Widget _notelpBookingTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nomor Telepon"),
      keyboardType: TextInputType.number,
      controller: _notelpBookingTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  } //end Widget _hargaBookingTextFIeld

  //tombol simpan
  Widget _buttonSubmit() {
    return ElevatedButton(
        onPressed: () {
          var validate = _formKey.currentState.validate();
          if (validate) {
            if (!_isLoading) {
              if (widget.booking != null) {
                //kondisi update booking
                ubah();
              } else {
                //kondisi simpan booking
                simpan();
              }
            }
          }
        },
        child: Text(tombolSubmit));
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });

    Booking createBooking = new Booking();
    createBooking.namaUser = _namaBookingTextboxController.text;
    createBooking.alamatUser = _alamatBookingTextboxController.text;
    createBooking.idJam = _jamBookingTextboxController.text;
    createBooking.tglJadwal = _jadwalBookingTextboxController.text;
    createBooking.idLapang = _lapangBookingTextboxController.text;
    //parse mengubah harga int menjadi string?
    createBooking.notelp = int.parse(_notelpBookingTextboxController.text);
    BookingBloc.addBooking(booking: createBooking).then((value) {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => BookingPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => WarningDialog(
                description: "Simpan gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });

    // Booking updateBooking = new Booking();
    // updateBooking.kodeBooking = _kodeBookingTextboxController.text;
    // updateBooking.namaBooking = _namaBookingTextboxController.text;
    // //parse mengubah harga int menjadi string?
    // updateBooking.hargaBooking = int.parse(_hargaBookingTextboxController.text);
    // BookingBloc.updateBooking(booking: updateBooking).then((value) {
    //   Navigator.of(context).push(new MaterialPageRoute(
    //       builder: (BuildContext context) => BookingPage()));
    // }, onError: (error) {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) => WarningDialog(
    //             description: "Update gagal, silahkan coba lagi",
    //           ));
    // });
    // setState(() {
    //   _isLoading = false;
    // });
  }
} //End _buttonSubmit Class
