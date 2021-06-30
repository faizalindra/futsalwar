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
      namaUser: obj['nama'],
      alamatUser: obj['alamat'],
      idJam: obj['id_jam'],
      tglJadwal: obj['tgl_jadwal'],
      idLapang: obj['id_lapang'],
      notelp: obj['notelp'],
    );
  }
}
