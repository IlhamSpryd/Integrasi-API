class Photo {
  final String url;
  final String title;
  final String category;

  Photo({required this.url, required this.title, required this.category});

  factory Photo.fromJson(Map<String, dynamic> json, String category) {
    return Photo(
      url: json['url'] ?? "",
      title: json['title'] ?? "Untitled",
      category: category,
    );
  }
}
