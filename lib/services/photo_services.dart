import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gallery_apps/model/photo_model.dart';

class PhotoService {
  static Future<List<Photo>> fetchAllPhotos() async {
    final cats = await _fetchCats();
    final ghibli = await _fetchGhibli();
    final got = await _fetchGot();

    return [...cats, ...ghibli, ...got];
  }

  static Future<List<Photo>> _fetchCats() async {
    final res = await http.get(
      Uri.parse("https://api.thecatapi.com/v1/images/search?limit=10"),
    );
    final List data = json.decode(res.body);
    return data
        .map((e) => Photo.fromJson({"url": e["url"], "title": "Cat"}, "Cat"))
        .toList();
  }

  static Future<List<Photo>> _fetchGhibli() async {
    final res = await http.get(Uri.parse("https://ghibliapi.vercel.app/films"));
    final List data = json.decode(res.body);
    return data
        .map(
          (e) => Photo.fromJson({
            "url": e["image"],
            "title": e["title"],
          }, "Ghibli"),
        )
        .toList();
  }

  static Future<List<Photo>> _fetchGot() async {
    final res = await http.get(
      Uri.parse("https://thronesapi.com/api/v2/Characters"),
    );
    final List data = json.decode(res.body);
    return data
        .map(
          (e) => Photo.fromJson({
            "url": e["imageUrl"],
            "title": e["fullName"],
          }, "Game Of Thrones"),
        )
        .toList();
  }
}
