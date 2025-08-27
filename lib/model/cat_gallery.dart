// To parse this JSON data, do
//
//     final catGallery = catGalleryFromJson(jsonString);

import 'dart:convert';

CatGallery catGalleryFromJson(String str) =>
    CatGallery.fromJson(json.decode(str));

String catGalleryToJson(CatGallery data) => json.encode(data.toJson());

class CatGallery {
  final List<Photo> photos;

  CatGallery({required this.photos});

  factory CatGallery.fromJson(Map<String, dynamic> json) => CatGallery(
    photos: json["photos"] == null
        ? []
        : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
  };
}

class Photo {
  final String? title;
  final String? description;
  final String? url;

  Photo({this.title, this.description, this.url});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    title: json["title"],
    description: json["description"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "url": url,
  };
}
