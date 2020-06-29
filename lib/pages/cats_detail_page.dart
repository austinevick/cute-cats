import 'package:cute_cats/models/cat_image.dart';
import 'package:cute_cats/models/cat_model.dart';
import 'package:cute_cats/webservice/webservice.dart';
import 'package:flutter/material.dart';

class CatsDetailPage extends StatefulWidget {
  final CatImage catImage;

  const CatsDetailPage({Key key, this.catImage}) : super(key: key);
  @override
  _CatsDetailPageState createState() => _CatsDetailPageState();
}

class _CatsDetailPageState extends State<CatsDetailPage> {
  List<CatModel> catList = [];
  Webservice webservice = Webservice();

  getCatListFromJson() {
    Future<List<CatModel>> list = webservice.getCatBreeds();
    list.then((value) {
      setState(() {
        this.catList = value;
      });
    });
  }

  @override
  void initState() {
    getCatListFromJson();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height / 1.5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.catImage.url))),
        ));
  }
}
