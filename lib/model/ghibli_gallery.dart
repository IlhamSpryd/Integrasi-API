// To parse this JSON data, do
//
//     final GhibliGallery = GhibliGalleryFromJson(jsonString);

import 'dart:convert';
import 'package:gallery_apps/model/cat_gallery.dart';

List<GhibliGallery> GhibliGalleryFromJson(String str) =>
    List<GhibliGallery>.from(
      json.decode(str).map((x) => GhibliGallery.fromJson(x)),
    );

String GhibliGalleryToJson(List<GhibliGallery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GhibliGallery {
  List<Photo> photos;
  GhibliGallery({required this.photos});
  factory GhibliGallery.fromJson(List<dynamic> jsonList) {
    List<Photo> photos = jsonList.map((json) => Photo.fromJson(json)).toList();
    return GhibliGallery(photos: photos);
  }
  Map<String, dynamic> toJson() => {
    "photos": photos.map((p) => p.toJson()).toList(),
  };
}
