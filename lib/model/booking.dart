class Booking {
  int id;
  String namaUser;
  String alamatUser;
  String idJam;
  String tglJadwal;
  String idLapang;
  int notelp;

  Booking(
      {this.id,
      this.namaUser,
      this.alamatUser,
      this.idJam,
      this.tglJadwal,
      this.idLapang,
      this.notelp});
  factory Booking.fromJson(Map<String, dynamic> obj) {
    return Booking(
      id: obj['id'],
      namaUser: obj['namaUser'],
      alamatUser: obj['alamatUser'],
      idJam: obj['idJam'],
      tglJadwal: obj['tglJadwal'],
      idLapang: obj['idLapang'],
      notelp: obj['notelp'],
    );
  }
}
