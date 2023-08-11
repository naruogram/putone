// FIXME: FlutterGenを導入する

extension AssetsExt on String {
  static String imagePath(String name) {
    return 'assets/images/$name.jpeg';
  }

  static String customImagePath(String name) {
    return 'assets/images/$name';
  }

  static String svgPath(String name) {
    return 'assets/svgs/$name.svg';
  }
}
