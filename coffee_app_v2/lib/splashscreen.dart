import 'package:coffee_app_v2/HomePage.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
    void _navigateToHome() {
    // Logic to navigate to HomePage
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Homepage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFECE0D1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: screenHeight,
          width: screenWidth,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.20), // Space above image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0), // Padding around image
                child: Image.asset(
                  'assets/splash.png',
                  width: screenWidth * 1, // Width of the image
                  fit: BoxFit.contain, // Ensures image fits within its bounds
                ),
              ),
              SizedBox(height: screenHeight * 0.08), // Decrease spacing below image
              const Text(
                'Stay Focused',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFF38220F),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Spacing below text
              const Text(
                'Wake up and smell the coffee. Start your day with the perfect brew. Your journey to caffeine bliss begins here.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 117, 116, 116),
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
              SizedBox(height: screenHeight * 0.1), // Space above button
              ElevatedButton(
                onPressed: _navigateToHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                child: Text(
                  'Dive In ->',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
