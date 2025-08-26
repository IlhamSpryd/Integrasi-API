// To parse this JSON data, do
//
//     final catGallery = catGalleryFromJson(jsonString);


import 'dart:convert';

CatGallery catGalleryFromJson(String str) => CatGallery.fromJson(json.decode(str));

String catGalleryToJson(CatGallery data) => json.encode(data.toJson());

class CatGallery {
  String? greeting;
  List<String>? instructions;
  List<Photo>? photos;

  CatGallery({
    this.greeting,
    this.instructions,
    this.photos,
  });

  factory CatGallery.fromJson(Map<String, dynamic> json) => CatGallery(
        greeting: json["greeting"],
        instructions: json["instructions"] == null
            ? []
            : List<String>.from(json["instructions"].map((x) => x)),
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "instructions": instructions == null
            ? []
            : List<dynamic>.from(instructions!.map((x) => x)),
        "photos": photos == null
            ? []
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
      };
}

class Photo {
  String? title;
  String? description;
  String? url;

  Photo({
    this.title,
    this.description,
    this.url,
  });

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
