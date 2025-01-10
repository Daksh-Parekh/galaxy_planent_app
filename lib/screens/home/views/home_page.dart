import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_planent_app/screens/home/provider/planet_provider.dart';
import 'package:galaxy_planent_app/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider hRead, hWatch;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: const Color(0xFF9354B9),
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
        // width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.favouritePage);
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 40,
                        color: Colors.red.withOpacity(0.8),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        hRead.changeTheme();
                      },
                      icon: hWatch.isLight
                          ? const Icon(
                              Icons.dark_mode_rounded,
                              color: Colors.white,
                              size: 40,
                            )
                          : const Icon(
                              Icons.light_mode_rounded,
                              color: Colors.amber,
                              size: 40,
                            ),
                    ),
                  ],
                ),
                const Text(
                  "Solar System",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 450,
                  child: Swiper(
                    itemCount: hRead.planetList.length,
                    // containerHeight: 400,
                    itemWidth: size.width,
                    itemHeight: size.height,
                    layout: SwiperLayout.TINDER,
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.white,
                        color: Colors.grey,
                        activeSize: 12,
                        size: 7,
                      ),
                      margin: EdgeInsets.all(4),
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.detailPage,
                            arguments: hRead.planetList[index]);
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            // clipBehavior: Clip.antiAlias,
                            padding: const EdgeInsets.all(30),
                            margin: const EdgeInsets.only(top: 80),
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 6,
                                  // spreadRadius: 6,
                                  offset: const Offset(3, 1),
                                ),
                              ],

                              // shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.12,
                                ),
                                Text(
                                  "${hWatch.planetList[index].name}",
                                  style: const TextStyle(
                                    color: Color(0xFF414C6B),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 50,
                                  ),
                                ),
                                const Text(
                                  "Solar System",
                                  style: TextStyle(
                                    color: Color(0xFF414C6B),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 28,
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      "Know More",
                                      style: TextStyle(
                                        color: Color(0xFFE4979E),
                                        fontWeight: FontWeight.w600,
                                        // fontFamily: 'Avenir',
                                        fontSize: 20,
                                      ),
                                      // textAlign: TextAlign.left,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xFFE4979E),
                                        size: 20,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          // SizedBox(
                          //   height: 320,
                          //   child: Card(
                          //     margin: EdgeInsets.only(top: 80),
                          //     elevation: 8,
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(32)),
                          //     color: Colors.white,
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         SizedBox(
                          //           height: 100,
                          //         ),
                          //         Text("data"),
                          //         Row(),
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          Hero(
                            tag: hWatch.planetList[index].orderSum!,
                            child: Image.asset(
                              hWatch.planetList[index].image!,
                              fit: BoxFit.contain,
                              height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
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
