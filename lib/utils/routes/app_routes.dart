import 'package:flutter/material.dart';
import 'package:galaxy_planent_app/screens/detail/views/detail_screen.dart';
import 'package:galaxy_planent_app/screens/favourite/view/favourite_page.dart';
import 'package:galaxy_planent_app/screens/home/views/home_page.dart';
import 'package:galaxy_planent_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static String splash = '/';
  static String homePage = 'home_page';
  static String detailPage = 'detail_page';
  static String favouritePage = 'fav_page';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    detailPage: (context) => const DetailPage(),
    favouritePage: (context) => const FavouritePage(),
  };
}
