import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galaxy_planent_app/screens/home/model/planent_model.dart';
import 'package:galaxy_planent_app/screens/home/provider/planet_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late HomeProvider hWatch;
  late AnimationController controller, txtController;
  late Animation<double> animation;
  late Animation<Offset> offSetAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    txtController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: txtController, curve: Curves.easeInOut),
    );
    offSetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.5),
      end: const Offset(0.0, 0.5),
    ).animate(txtController);
    txtController.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Planet model = ModalRoute.of(context)!.settings.arguments as Planet;
    Size size = MediaQuery.sizeOf(context);
    hWatch = context.watch<HomeProvider>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: hWatch.isLight
                ? [
                    const Color(0xFF4051A9).withOpacity(0.6),
                    const Color(0xFF9354B9).withOpacity(0.6)
                  ]
                : [
                    const Color(0xff2C3E50).withOpacity(0.8),
                    const Color(0xff2C3E50).withOpacity(0.8)
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.9],
          ),
        ),
        child: SafeArea(
          // bottom: false,
          child: Stack(
            // alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(36),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.32,
                      ),
                      FadeTransition(
                        opacity: animation,
                        child: Text(
                          model.name!,
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                            color: hWatch.isLight
                                ? const Color(0xFF414C6B)
                                : const Color.fromARGB(255, 158, 175, 223),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FadeTransition(
                            opacity: animation,
                            child: Text(
                              'Solar System',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w300,
                                color: hWatch.isLight
                                    ? const Color(0xFF414C6B)
                                    : const Color.fromARGB(255, 158, 175, 223),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<HomeProvider>()
                                  .saveFavouritePlanet(model.name!);
                            },
                            icon: hWatch.favouritePlanets.contains(model.name)
                                ? Icon(
                                    Icons.favorite,
                                    size: 42,
                                    color: Colors.red.withOpacity(0.8),
                                  )
                                : Icon(
                                    Icons.favorite_border_outlined,
                                    size: 42,
                                    color: Colors.red.withOpacity(0.8),
                                  ),
                          ),
                        ],
                      ),
                      const Divider(),
                      FadeTransition(
                        opacity: animation,
                        child: Text(
                          "${model.desc}",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      const Divider(),
                      FadeTransition(
                        opacity: animation,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Diameter: ',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              TextSpan(
                                text: "${model.diameter}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      FadeTransition(
                        opacity: animation,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Mass: ',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              TextSpan(
                                text: "${model.mass}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      FadeTransition(
                        opacity: animation,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Avg Orbit Speed: ',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              TextSpan(
                                text: "${model.avgOrbitSpeed}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      FadeTransition(
                        opacity: animation,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Surface Area: ',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              TextSpan(
                                text: "${model.surfaceArea}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      FadeTransition(
                        opacity: animation,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Rotation Period: ',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              TextSpan(
                                text: "${model.rotationPeriod}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
              //Planet No.
              Align(
                alignment: const Alignment(-0.5, -0.8),
                child: Text(
                  "${model.orderSum}",
                  style: TextStyle(
                    fontSize: 240,
                    color: hWatch.isLight
                        ? const Color(0xFF414C6B).withOpacity(0.1)
                        : const Color.fromARGB(255, 194, 207, 245)
                            .withOpacity(0.1),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              //Planent Image
              Align(
                alignment: const Alignment(2.3, -1),
                child: AnimatedBuilder(
                  animation: controller,
                  child: Hero(
                    tag: model.orderSum!,
                    child: Image.asset(
                      model.image!,
                      height: 240,
                    ),
                  ),
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: pi * 2 * controller.value,
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
