class CatImage {
  final String url;

  CatImage({this.url});
  factory CatImage.fromMap(Map<String, dynamic> map) {
    return CatImage(url: map['url']);
  }
  @override
  String toString() => 'url: $url';
}
