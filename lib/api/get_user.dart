import 'dart:convert';
import 'package:gallery_apps/model/cat_gallery.dart';
import 'package:http/http.dart' as http;

/// Fungsi untuk mengambil data kucing dari The Cat API
Future<CatGallery> getCatGallery() async {
  final response = await http.get(
    Uri.parse("https://api.thecatapi.com/v1/images/search?limit=10"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);

    List<Photo> photos = jsonList.map((json) {
      String title = "Cat Photo";
      String description = "Cute cat photo";

      if (json['breeds'] != null && json['breeds'].isNotEmpty) {
        title = json['breeds'][0]['name'];
        description = json['breeds'][0]['description'] ?? description;
      }

      return Photo(
        url: json['url'],
        title: title,
        description: description,
      );
    }).toList();

    return CatGallery(
      greeting: "Welcome to Cat Gallery!",
      instructions: ["Feed them", "Pet them gently"],
      photos: photos,
    );
  } else {
    throw Exception("Gagal memuat data");
  }
}
