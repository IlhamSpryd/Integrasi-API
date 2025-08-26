import 'package:flutter/material.dart';
import 'package:gallery_apps/api/get_user.dart';
import 'package:gallery_apps/model/cat_gallery.dart';

class Day23GetAPIScreen extends StatefulWidget {
  const Day23GetAPIScreen({super.key});
  static const id = "/get_api_screen";

  @override
  State<Day23GetAPIScreen> createState() => _Day23GetAPIScreenState();
}

class _Day23GetAPIScreenState extends State<Day23GetAPIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<CatGallery>(
        future: getCatGallery(),
        builder: (BuildContext context, AsyncSnapshot<CatGallery> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final gallery = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    gallery.greeting ?? "",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 kolom, mirip iPhone gallery
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: gallery.photos?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final photo = gallery.photos![index];
                      return GestureDetector(
                        onTap: () {
                          // Bisa nambah navigasi ke detail screen nanti
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            photo.url ?? "https://via.placeholder.com/150",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(
                child: Text(
              "Gagal memuat data",
              style: TextStyle(color: Colors.white),
            ));
          }
        },
      ),
    );
  }
}
