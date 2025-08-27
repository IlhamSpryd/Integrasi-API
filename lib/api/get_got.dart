import 'dart:convert';
import 'package:gallery_apps/model/got_gallery.dart';
import 'package:http/http.dart' as http;

Future<GameOfThrones> getGameOfThrones() async {
  final response = await http.get(
    Uri.parse("https://thronesapi.com/api/v2/Characters"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);
    return GameOfThrones.fromJson(jsonList); 
  } else {
    throw Exception("Gagal memuat data Game of Thrones");
  }
}
