import 'package:cute_cats/models/cat_image.dart';
import 'package:cute_cats/models/cat_model.dart';

class CatBreedViewModel {
  final CatModel _catModel;
  CatBreedViewModel({CatModel catModel}) : _catModel = catModel;

  String get id => _catModel.id;
  String get name => _catModel.name;
  String get temp => _catModel.temperament;
  String get wiki => _catModel.wikipediaUrl;
  String get origin => _catModel.origin;
  String get desc => _catModel.description;
  String get dogFriendly => _catModel.dogFriendly;
  String get childFriendly => _catModel.childFriendly;
}

class CatImageViewModel {
  final CatImage _catImage;
  CatImageViewModel({CatImage catImage}) : _catImage = catImage;

  String get image => _catImage.url;
}
