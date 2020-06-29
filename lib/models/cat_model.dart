class CatModel {
  final String id;
  final String name;
  final String temperament;
  final String wikipediaUrl;
  final String origin;
  final String url;
  final String description;
  final String dogFriendly;
  final String childFriendly;

  CatModel(
      {this.id,
      this.url,
      this.name,
      this.temperament,
      this.wikipediaUrl,
      this.origin,
      this.description,
      this.dogFriendly,
      this.childFriendly});
  factory CatModel.fromJson(Map<String, dynamic> map) {
    return CatModel(
        id: map['id'],
        name: map['name'],
        url: map['url'],
        temperament: map['temperament'],
        wikipediaUrl: map['wikipedia_url'],
        origin: map['origin'],
        description: map['description'],
        dogFriendly: map['dog_friendly'].toString(),
        childFriendly: map['child_friendly'].toString());
  }
}
