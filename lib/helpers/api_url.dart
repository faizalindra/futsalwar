class ApiUrl {
  static const String baseUrl = "Http://10.0.2.2/futsal-api/public";

  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String booking = baseUrl + '/booking';
  static const String createBooking = baseUrl + '/booking';

  // static String updateBooking(int id) {
  //   return baseUrl + '/booking/' + id.toString() + '/update';
  // }

  static String showBooking(int id) {
    return baseUrl + '/booking/' + id.toString();
  }

  static String deleteBooking(int id) {
    return baseUrl + '/booking/' + id.toString();
  }
}
