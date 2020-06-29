import 'package:cute_cats/models/cat_image.dart';
import 'package:cute_cats/models/cat_model.dart';
import 'package:cute_cats/pages/cats_detail_page.dart';
import 'package:cute_cats/pages/page_route_transition.dart';
import 'package:cute_cats/webservice/webservice.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: Webservice().getCatImage(),
            builder: (context, AsyncSnapshot<List<CatImage>> snapshot) {
              if (snapshot.hasData) {
                return NestedScrollView(
                    headerSliverBuilder: ((context, innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          actions: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.search,
                                  size: 28,
                                ),
                                onPressed: () {})
                          ],
                          flexibleSpace: FlexibleSpaceBar(
                              centerTitle: true,
                              background: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Good morning, Kitten',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                  ),
                                ),
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://cdn2.thecatapi.com/images/MTY2ODc2Mg.jpg'))),
                              )),
                          expandedHeight: 200,
                          floating: false,
                          pinned: false,
                        ),
                        SliverGrid(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              final cat = snapshot.data[index];
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    PageRouteTransition(
                                        widget: CatsDetailPage(
                                      catImage: cat,
                                    ))),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(cat.url))),
                                ),
                              );
                            }, childCount: snapshot.data.length),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4))
                      ];
                    }),
                    body: Container(
                      height: 200,
                      width: 300,
                      color: Colors.green,
                    ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

/*
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  SliverAppBarDelegate({this.tabBar});

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.blue,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
*/
