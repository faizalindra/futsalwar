import 'dart:convert';

import 'package:futsalwar/helpers/api.dart';
import 'package:futsalwar/helpers/api_url.dart';
import 'package:futsalwar/model/registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String nama, String username, String email, String password}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = {
      "nama": nama,
      "username": username,
      "email": email,
      "password": password
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}
