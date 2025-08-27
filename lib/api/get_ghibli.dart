import 'dart:convert';
import 'package:gallery_apps/model/cat_gallery.dart';
import 'package:gallery_apps/model/ghibli_gallery.dart';
import 'package:http/http.dart' as http;

Future<GhibliGallery> getGhibliGallery() async {
  final response = await http.get(
    Uri.parse("https://ghibliapi.vercel.app/films"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);

    List<Photo> photos = jsonList.map((json) {
      final imageUrl = json['image'] ?? '';
      return Photo(url: imageUrl);
    }).toList();

    return GhibliGallery(photos: photos);
  } else {
    throw Exception("Gagal memuat data");
  }
}
