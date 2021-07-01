import 'dart:convert';

import 'package:futsalwar/helpers/api.dart';
import 'package:futsalwar/helpers/api_url.dart';
import 'package:futsalwar/model/booking.dart';

class BookingBloc {
  static Future<List<Booking>> getBookings() async {
    String apiUrl = ApiUrl.booking;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> booking = (jsonObj as Map<String, dynamic>)['data'];
    List<Booking> bookings = [];
    for (int i = 0; i < booking.length; i++) {
      bookings.add(Booking.fromJson(booking[i]));
    }
    return bookings;
  }

  static Future addBooking({Booking booking}) async {
    String apiUrl = ApiUrl.createBooking;

    var body = {
      "nama": booking.namaUser,
      "alamat": booking.alamatUser,
      "id_jam": booking.idJam,
      "tgl_jadwal": booking.tglJadwal,
      "id_lapang": booking.idLapang,
      "notelp": booking.notelp.toString(),
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> deleteBooking({int id}) async {
    String apiUrl = ApiUrl.deleteBooking(id);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}
