import 'package:flutter/material.dart';
import 'package:futsalwar/bloc/produk_bloc.dart';
import 'package:futsalwar/model/produk.dart';
import 'package:futsalwar/ui/produk_form.dart';
import 'package:futsalwar/ui/produk_page.dart';
import 'package:futsalwar/widget/warning_dialog.dart';

// ignore: must_be_immutable
class ProdukDetail extends StatefulWidget {
  Produk produk;
  ProdukDetail({this.produk});
  @override
  _ProdukDetailState createState() => _ProdukDetailState();
} //end class ProdukDetail

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.produk.kodeProduk}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk.namaProduk}",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : ${widget.produk.hargaProduk}",
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
                      builder: (context) => ProdukForm(
                            produk: widget.produk,
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
            ProdukBloc.deleteProduk(id: widget.produk.id).then((value) {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => ProdukPage()));
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
} //end class _ProdukDetailState
