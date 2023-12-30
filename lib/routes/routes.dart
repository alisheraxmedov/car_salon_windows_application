import 'package:tttt/screen/basket.dart';
import 'package:tttt/screen/buy.dart';
import 'package:tttt/screen/favourite.dart';
import 'package:tttt/screen/home.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CarHomePage.routeName:
      return MaterialPageRoute(builder: (contex) => const CarHomePage());
    case FavouritePage.routeName:
      return MaterialPageRoute(builder: (contex) => const FavouritePage());
    case CarBuyPage.routeName:
      return MaterialPageRoute(builder: (contex) => const CarBuyPage());
    case MyBasket.routeName:
      return MaterialPageRoute(builder: (contex) => const MyBasket());

    default:
      return MaterialPageRoute(
        builder: (contex) => const Scaffold(
          body: Center(
            child: Text(
              "Page Not Nound",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
  }
}
