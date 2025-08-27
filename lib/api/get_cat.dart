import 'dart:convert';

import 'package:gallery_apps/model/cat_gallery.dart';
import 'package:http/http.dart' as http;

Future<CatGallery> getCatGallery() async {
  final response = await http.get(
    Uri.parse("https://api.thecatapi.com/v1/images/search?limit=10"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);

    List<Photo> photos = jsonList.map((json) {
      if (json['breeds'] != null && json['breeds'].isNotEmpty) {}

      return Photo(url: json['url']);
    }).toList();

    return CatGallery(photos: photos);
  } else {
    throw Exception("Gagal memuat data dari Cat API");
  }
}
