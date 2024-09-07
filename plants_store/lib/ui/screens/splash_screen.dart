import 'dart:async';
import 'package:flutter/material.dart';
import '../onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController
      controller; // Animation controller for managing the animation
  late Animation<double> scaleAnimation; // Animation for scaling the image

  @override
  void initState() {
    super.initState();

    // Create an AnimationController for managing the animation
    controller = AnimationController(
      duration:
          const Duration(seconds: 1), // Duration of the animation (adjust as needed)
      vsync: this, // Provides the TickerProvider (this widget)
    );

    // Create a scale animation from 0.0 to 1.0 for popping up the image
    scaleAnimation = Tween<double>(
      begin: 0.0, // Start with no scale (hidden)
      end: 1.0, // End with full scale (normal size)
    ).animate(CurvedAnimation(
      parent: controller,
      curve:
          Curves.easeOutBack, // Animation curve (you can change it as needed)
    ));
    // =============================================================
    // Set a timer to navigate to the login screen after a delay
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    });
    // =============================================================

    // Start the pop-up animation after a delay
    Timer(const Duration(milliseconds: 500), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ScaleTransition(
            scale: scaleAnimation, // Apply the scale animation to the image
            child: const Image(
                image: AssetImage(
                    "assets/images/logo-light.png")), // Display the image
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller
        .dispose(); // Dispose of the animation controller to free up resources
    super.dispose();
  }
}
