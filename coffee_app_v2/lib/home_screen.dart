import 'package:coffee_app_v2/circular_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,top: 70),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                elevation: 10,
                color: Colors.white.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                  child: Column(
                    children: [
                      squareRow(),
                      squareRow(),
                    ],
                  ),
                ),

                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                    child: Image.asset("assets/homeperson.png",
                    height: 60,
                    width: 60,
                    ),
                  
                )
              ],
            ),
            const SizedBox(height: 20,),
            const Text("Find the best",
            style: TextStyle(color: Color(0xFF444444),
            fontWeight:FontWeight.bold,
            fontSize: 25,
             )
            ),
            const Text("Coffee to your taste",
            style: TextStyle(color: Color(0xFF444444),
            fontWeight:FontWeight.bold,
            fontSize: 25,
             )
            )
          ],
        ) ,
      ),
    );
  }
}