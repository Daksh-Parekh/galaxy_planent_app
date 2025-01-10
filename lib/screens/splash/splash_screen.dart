import 'dart:async';

import 'package:flutter/material.dart';
import 'package:galaxy_planent_app/utils/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.forward();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, AppRoutes.homePage);
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/spashscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16),
        alignment: const Alignment(-1, -0.9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: animation,
              child: const Text(
                "EXPLORE\nUNIVERSE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment(0.9, 0),
              child: Text(
                "🚀",
                style: TextStyle(
                  fontSize: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
