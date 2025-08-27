import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_apps/model/photo_model.dart';
import 'package:gallery_apps/services/photo_services.dart';
import 'package:gallery_apps/widgets/photo_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const id = "/dashboard";

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<List<Photo>> _futurePhotos;
  List<Photo> _allPhotos = [];
  String _selectedFilter = "All";

  final List<String> _filters = ["All", "Cat", "Ghibli", "Game Of Thrones"];

  @override
  void initState() {
    super.initState();
    _futurePhotos = PhotoService.fetchAllPhotos();
  }

  List<Photo> _getFilteredPhotos() {
    if (_selectedFilter == "All") return _allPhotos;
    return _allPhotos.where((p) => p.category == _selectedFilter).toList();
  }

  Widget _buildFilterChips(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: _filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (_) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              selectedColor: Colors.red,
              backgroundColor: theme.colorScheme.surface,
              labelStyle: TextStyle(
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: FutureBuilder<List<Photo>>(
        future: _futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Gagal memuat data: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada gambar"));
          }

          if (_allPhotos.isEmpty) _allPhotos = snapshot.data!;
          final photos = _getFilteredPhotos();

          return SafeArea(
            child: Column(
              children: [
                _buildFilterChips(context),
                Expanded(
                  child: MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    padding: const EdgeInsets.all(8),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return PhotoCard(photo: photos[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
