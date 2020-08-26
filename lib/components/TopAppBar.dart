import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantshop/screens/cartScreen.dart';
import 'package:plantshop/screens/plantFeatureScreen1.dart';

// class RouteTaker extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     createRoute();
//   }
// }
Route createRouteAddToCart() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CartDetais3(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(3.0, 3.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
Route createRouteGoToHome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PlantFeatureScreen1(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(3.0, 3.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class TopAppBar extends StatelessWidget {
  final Function onPressedFunction;
  final IconData appBarIcon;
  const TopAppBar({this.onPressedFunction, this.appBarIcon, Null Function() onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 12, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(createRouteGoToHome());
            },
            child: Icon(
              FontAwesomeIcons.airbnb,
              size: 35,
              color: Color(0xFFC1C2C4),
            ),
          ),
          GestureDetector(
            onTap: onPressedFunction,
            child: Icon(
              appBarIcon,
              size: 35,
              color: Color(0xFFC1C2C4),
            ),
          ),
        ],
      ),
    );
  }
}
