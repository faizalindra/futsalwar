class Produk {
  int id;
  String kodeProduk;
  String namaProduk;
  int hargaProduk;

  Produk({this.id, this.kodeProduk, this.hargaProduk, this.namaProduk});
  factory Produk.fromJson(Map<String, dynamic> obj) {
    return Produk(
      id: obj['id'],
      kodeProduk: obj['kodeProduk'],
      hargaProduk: obj['harga'],
      namaProduk: obj['namaProduk'],
    );
  }
}
