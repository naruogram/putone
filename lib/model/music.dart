class Music {
  final String name;
  final String artist;
  final String imagePath;
  final String? descroption;

  Music({
    required this.name,
    required this.artist,
    required this.imagePath,
    this.descroption,
  });
}
