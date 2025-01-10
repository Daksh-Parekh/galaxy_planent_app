import 'package:flutter/material.dart';
import 'package:galaxy_planent_app/screens/home/model/planent_model.dart';
import 'package:galaxy_planent_app/screens/home/provider/planet_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late HomeProvider hRead, hWatch;
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    List<Planet> favPlanet = hWatch.planetList
        .where(
          (element) => hWatch.favouritePlanets.contains(element.name),
        )
        .toList();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: hWatch.isLight
                ? [const Color(0xFF4051A9), const Color(0xFF9354B9)]
                : [const Color(0xff2C3E50), const Color(0xff2C3E50)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.9],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Align(
                      alignment: const Alignment(-0.9, -0.96),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const Text(
                      "Favorite Planets...",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: favPlanet.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 150,
                        child: Stack(
                          alignment: const Alignment(1.1, -1.3),
                          children: [
                            Card(
                              child: ListTile(
                                title: Text(
                                  "${favPlanet[index].name}",
                                  style: const TextStyle(
                                    color: Color(0xFF414C6B),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "${favPlanet[index].desc}",
                                  style: const TextStyle(
                                    color: Color(0xFFE4979E),
                                    fontSize: 16,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    hRead.saveFavouritePlanet(
                                        favPlanet[index].name!);
                                  },
                                  icon: const Icon(
                                    Icons.delete_rounded,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                              favPlanet[index].image!,
                              height: 75,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
