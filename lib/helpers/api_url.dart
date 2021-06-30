class ApiUrl {
  static const String baseUrl = "Http://10.0.2.2/futsal-api/public";

  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String booking = baseUrl + '/booking';
  static const String createBooking = baseUrl + '/booking';

  static String updateProduk(int id) {
    return baseUrl + '/produk/' + id.toString() + '/update';
  }

  static String showProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  static String deleteProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }
}
