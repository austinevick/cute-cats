import 'dart:convert';

import 'package:cute_cats/models/cat_image.dart';
import 'package:cute_cats/models/cat_model.dart';
import 'package:cute_cats/secret.dart';
import 'package:http/http.dart' as http;

class Webservice {
  final String url = "https://api.thecatapi.com/v1/breeds?attach_breed=0#";
  final String imageUrl =
      "https://api.thecatapi.com/v1/images/search?limit=50&page=10&order=Asc";

  Future<List<CatModel>> getCatBreeds() async {
    final response = await http.get(url, headers: {'x-api-key': apikey});
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Iterable list = body;
      print(body);
      return list.map((e) => CatModel.fromJson(e)).toList();
    } else {
      print('${response.statusCode} ${response.reasonPhrase}');
      throw response;
    }
  }

  Future<List<CatImage>> getCatImage() async {
    final response = await http.get(imageUrl, headers: {'x-api-key': apikey});
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Iterable list = body;
      print(body);
      return list.map((e) => CatImage.fromMap(e)).toList();
    } else {
      print('${response.statusCode} ${response.reasonPhrase}');
      throw response;
    }
  }
}
