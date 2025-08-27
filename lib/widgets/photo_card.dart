import 'package:flutter/material.dart';
import 'package:gallery_apps/model/photo_model.dart';
import 'package:gallery_apps/widgets/photo_menu.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;
  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.network(photo.url, fit: BoxFit.cover),
          Positioned(
            right: 8,
            bottom: 8,
            child: PhotoMenuButton(
              size: 18,
              backgroundSize: 32,
              backgroundColor: Colors.white,
              backgroundOpacity: 0.2,
              onEdit: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Edit ${photo.title}")));
              },
              onDelete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Delete ${photo.title}")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
