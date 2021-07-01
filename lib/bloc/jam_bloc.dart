import 'dart:convert';

import 'package:futsalwar/helpers/api.dart';
import 'package:futsalwar/helpers/api_url.dart';
import 'package:futsalwar/model/jam.dart';

class JamBloc {
  static Future<List<JamModel>> getJam() async {
    String apiUrl = ApiUrl.jam;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> jam = (jsonObj as Map<String, dynamic>)['data'];
    List<JamModel> jams = [];
    for (int i = 0; i < jam.length; i++) {
      jams.add(JamModel.fromJson(jam[i]));
    }
    return jams;
  }
}
