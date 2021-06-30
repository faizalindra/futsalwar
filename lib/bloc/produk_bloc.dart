import 'dart:convert';

import 'package:futsalwar/helpers/api.dart';
import 'package:futsalwar/helpers/api_url.dart';
import 'package:futsalwar/model/produk.dart';

class ProdukBloc {
  static Future<List<Produk>> getProduks() async {
    String apiUrl = ApiUrl.booking;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> booking = (jsonObj as Map<String, dynamic>)['data'];
    List<Produk> produks = [];
    for (int i = 0; i < booking.length; i++) {
      produks.add(Produk.fromJson(booking[i]));
    }
    return produks;
  }

  static Future addProduk({Produk produk}) async {
    String apiUrl = ApiUrl.createBooking;

    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString()
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateProduk({Produk produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk.id);

    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString()
    };
    print("Body : $body");
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['data'];
  }

  static Future<bool> deleteProduk({int id}) async {
    String apiUrl = ApiUrl.deleteProduk(id);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}
