import 'package:flutter/material.dart';
import 'package:galaxy_planent_app/screens/home/provider/planet_provider.dart';
import 'package:galaxy_planent_app/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: HomeProvider()
              ..solarSystemData()
              ..getFavouritePlanentList())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    );
  }
}
