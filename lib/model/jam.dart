class JamModel {
  int id;
  String ket_jam;

  JamModel({
    this.id,
    this.ket_jam,
  });
  factory JamModel.fromJson(Map<String, dynamic> obj) {
    return JamModel(
      id: obj['id_jam'],
      ket_jam: obj['jam'],
    );
  }
}
