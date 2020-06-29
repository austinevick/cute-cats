import 'package:cute_cats/view_models/cat_view_model.dart';
import 'package:cute_cats/webservice/webservice.dart';
import 'package:flutter/cupertino.dart';

class CatsListViewModel extends ChangeNotifier {
  List<CatImageViewModel> catsImage = List<CatImageViewModel>();
  Future<void> populateHomePage() async {
    final result = await Webservice().getCatImage();
    this.catsImage =
        result.map((cats) => CatImageViewModel(catImage: cats)).toList();
    notifyListeners();
  }

  List<CatBreedViewModel> catBreedList = List<CatBreedViewModel>();

  Future<void> populatePage() async {
    final result = await Webservice().getCatBreeds();
    this.catBreedList =
        result.map((map) => CatBreedViewModel(catModel: map)).toList();
    notifyListeners();
  }
}
