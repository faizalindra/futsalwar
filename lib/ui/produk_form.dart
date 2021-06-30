import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futsalwar/bloc/produk_bloc.dart';
import 'package:futsalwar/model/produk.dart';
import 'package:futsalwar/ui/produk_page.dart';
import 'package:futsalwar/widget/warning_dialog.dart';

// ignore: must_be_immutable
class ProdukForm extends StatefulWidget {
  Produk produk;
  ProdukForm({this.produk});
  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Produk";
  String tombolSubmit = "Simpan";

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  } //end initState

  //untuk menyimpan data
  isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "Ubah Produk";
        tombolSubmit = "Ubah";
        _kodeProdukTextboxController.text = widget.produk.kodeProduk;
        _namaProdukTextboxController.text = widget.produk.namaProduk;
        _hargaProdukTextboxController.text =
            widget.produk.hargaProduk.toString();
      });
    } else {
      judul = "Tambah Produk";
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
                    _kodeProdukTextField(),
                    _namaProdukTextField(),
                    _hargaProdukTextField(),
                    _buttonSubmit()
                  ],
                )),
          ),
        ),
      ),
    );
  } //end Widget build

  //membuat textbox kode produk
  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Kode Produk"),
      keyboardType: TextInputType.text,
      controller: _kodeProdukTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Kode Produk harus diisi";
        }
        return null;
      },
    );
  } //end Widget _kodeProdukTextFIeld

  //membuat textbox nama produk
  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nama Produk"),
      keyboardType: TextInputType.text,
      controller: _namaProdukTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Nama Produk harus diisi";
        }
        return null;
      },
    );
  } //end Widget _namaProdukTextFIeld

  //membuat textbox harga produk
  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  } //end Widget _hargaProdukTextFIeld

  //tombol simpan
  Widget _buttonSubmit() {
    return ElevatedButton(
        onPressed: () {
          var validate = _formKey.currentState.validate();
          if (validate) {
            if (!_isLoading) {
              if (widget.produk != null) {
                //kondisi update produk
                ubah();
              } else {
                //kondisi simpan produk
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

    Produk createBooking = new Produk();
    createBooking.kodeProduk = _kodeProdukTextboxController.text;
    createBooking.namaProduk = _namaProdukTextboxController.text;
    //parse mengubah harga int menjadi string?
    createBooking.hargaProduk = int.parse(_hargaProdukTextboxController.text);
    ProdukBloc.addProduk(produk: createBooking).then((value) {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => ProdukPage()));
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

    Produk updateProduk = new Produk();
    updateProduk.kodeProduk = _kodeProdukTextboxController.text;
    updateProduk.namaProduk = _namaProdukTextboxController.text;
    //parse mengubah harga int menjadi string?
    updateProduk.hargaProduk = int.parse(_hargaProdukTextboxController.text);
    ProdukBloc.updateProduk(produk: updateProduk).then((value) {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => ProdukPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => WarningDialog(
                description: "Update gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
} //End _buttonSubmit Class
