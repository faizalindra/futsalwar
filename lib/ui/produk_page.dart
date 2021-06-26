import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:futsalwar/bloc/logout_bloc.dart';
import 'package:futsalwar/bloc/produk_bloc.dart';
import 'package:futsalwar/model/produk.dart';
import 'package:futsalwar/ui/login_page.dart';
import 'package:futsalwar/ui/produk_detail.dart';
import 'package:futsalwar/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  @override
  _ProdukPagesState createState() => _ProdukPagesState();
}

//
// File ini digunakan untuk menampilkan Produk
//
class _ProdukPagesState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Produk'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: Icon(Icons.add, size: 26.0),
              onTap: () async {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => ProdukForm()));
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
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListProduk(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      // body: ListView(
      //   children: [
      //     ItemProduk(
      //         produk: Produk(
      //             id: 1,
      //             kodeProduk: 'A001',
      //             namaProduk: 'HP Laptop',
      //             hargaProduk: 6700000)),
      //     ItemProduk(
      //         produk: Produk(
      //             id: 1,
      //             kodeProduk: 'A002',
      //             namaProduk: 'Asus Laptop',
      //             hargaProduk: 7700000)),
      //     ItemProduk(
      //         produk: Produk(
      //             id: 1,
      //             kodeProduk: 'A003',
      //             namaProduk: 'Lenovo Laptop',
      //             hargaProduk: 5700000)),
      //   ],
      // ),
    );
  } //end Widget
} // end class _produkPages State

class ItemProduk extends StatelessWidget {
  final Produk produk;
  ItemProduk({this.produk});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => ProdukDetail(
                        produk: produk,
                      )));
        },
        child: Card(
          child: ListTile(
            title: Text(produk.namaProduk.toString()),
            subtitle: Text(produk.hargaProduk.toString()),
          ),
        ),
      ),
    );
  }
} // end class ItemProduk

class ListProduk extends StatelessWidget {
  final List list;
  ListProduk({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return ItemProduk(
            produk: list[i],
          );
        });
  }
}
