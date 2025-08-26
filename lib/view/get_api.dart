import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_apps/api/get_user.dart';
import 'package:gallery_apps/model/cat_gallery.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const id = "/get_api_screen";

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<CatGallery> _futureGallery;

  @override
  void initState() {
    super.initState();
    _futureGallery = getCatGallery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat Gallery"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<CatGallery>(
        future: _futureGallery,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Gagal memuat data",
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (snapshot.hasData) {
            final gallery = snapshot.data!;
            final photos = gallery.photos ?? [];

            if (photos.isEmpty) {
              return const Center(
                child: Text(
                  "Tidak ada gambar",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            photo.url ?? "",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                            loadingBuilder:
                                (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 200,
                                color: Colors.grey[800],
                                child: const Icon(Icons.error,
                                    color: Colors.red),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.more_vert,
                                  color: Colors.white, size: 20),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: 120,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading:
                                                const Icon(Icons.download),
                                            title: const Text("Download"),
                                            onTap: () =>
                                                Navigator.pop(context),
                                          ),
                                          ListTile(
                                            leading: const Icon(Icons.share),
                                            title: const Text("Share"),
                                            onTap: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (photo.title != null)
                      Text(
                        photo.title!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    if (photo.description != null)
                      Text(
                        photo.description!,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.white70),
                      ),
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "Data tidak tersedia",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
