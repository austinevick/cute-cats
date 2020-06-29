import 'package:flutter/widgets.dart';

class PageRouteTransition extends PageRouteBuilder {
  final Widget widget;

  PageRouteTransition({this.widget})
      : super(
            pageBuilder: (context, animate, animation) => widget,
            transitionDuration: Duration(seconds: 3),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.center,
              );
            });
}
