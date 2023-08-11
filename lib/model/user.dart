class User {
  final String name;
  final String id;
  final String imagePath;
  final String? postTitle;

  User({
    required this.name,
    required this.id,
    required this.imagePath,
    this.postTitle,
  });
}
