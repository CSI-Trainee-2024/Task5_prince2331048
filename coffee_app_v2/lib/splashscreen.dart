import 'package:flutter/material.dart';
import 'package:coffee_app_v2/size.dart';
import 'package:coffee_app_v2/HomePage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState(){
    super.initState();
    _navigateToHome();

  }
  _navigateToHome()async{
    await Future.delayed(const Duration(milliseconds: 10000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 223, 202),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(
                  'assets/splash.png',
                  width: SizeConfig.screenWidth * 1,
                  fit: BoxFit.contain,
                  
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              const Text(
                'Stay Focused',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFF38220F),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Wake up and smell the coffee. Start your day with the perfect brew. Your journey to caffeine bliss begins here.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(255, 113, 111, 111),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 150, 114, 102),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Dive In',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }

