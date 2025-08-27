// To parse this JSON data, do
//
//     final GameOfThrones = GameOfThronesFromJson(jsonString);

import 'package:gallery_apps/model/photo_model.dart';

class GameOfThrones {
  List<Photo> photos;

  GameOfThrones({required this.photos});

  factory GameOfThrones.fromJson(List<dynamic> jsonList) {
    List<Photo> photos = jsonList.map((json) {
      return Photo(
        url: json['imageUrl'] ?? '',
        title: json['fullName'] ?? '',
        category: 'Game of Thrones',
      );
    }).toList();

    return GameOfThrones(photos: photos);
  }
}
