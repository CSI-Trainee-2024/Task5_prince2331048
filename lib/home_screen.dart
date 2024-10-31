import 'package:flutter/material.dart';
import 'package:coffee_app_v2/circular_icon.dart';
import 'package:coffee_app_v2/resorces_list.dart';
import 'package:coffee_app_v2/size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  Widget buildCoffeeCard(int index) {
    return Card(
      elevation: 5,
      color: Colors.white.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(top: 20),
      child: Container(
        padding: const EdgeInsets.all(0),
        width: 250,
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1d2630).withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 14,
                            ),
                            Text(
                              ratings[index].toString(),
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              names[index],
              style: const TextStyle(
                color: Color(0xFF444444),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              descriptions[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            Text(
              prices[index],
              style: const TextStyle(
                color: Color(0xFF444444),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    // Add your onPressed code here
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    if (names.isEmpty || descriptions.isEmpty || ratings.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()), // Loading indicator
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
        child: Column(
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
                    padding: const EdgeInsets.all(10),
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
                  child: Image.asset(
                    "assets/homeperson.png",
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Find the best",
              style: TextStyle(
                color: Color(0xFF444444),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Text(
              "Coffee to your taste",
              style: TextStyle(
                color: Color(0xFF444444),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.brown.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.coffee,
                          color: Colors.brown.withOpacity(0.3),
                        ),
                        border: InputBorder.none,
                        hintText: "Find Your Coffee...",
                        hintStyle: TextStyle(
                          color: Colors.brown.withOpacity(0.3),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.brown.withOpacity(0.1),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.brown.withOpacity(0.7),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: names.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            names[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.brown
                                  : Colors.brown.withOpacity(0.4),
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          if (selectedIndex == index)
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              height: 2,
                              width: 30,
                              color: Colors.brown,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: SizeConfig.isPortrait ? 2 : 3,
                childAspectRatio: SizeConfig.isPortrait ? 0.8 : 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return buildCoffeeCard(index);
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Special for you",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              width: SizeConfig.screenWidth * 0.8,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.brown,
              ),
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.screenWidth * 0.4,
                    width: SizeConfig.screenWidth * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.brown.withOpacity(0.1),
                      image: const DecorationImage(
                        image: NetworkImage("https://static.toiimg.com/thumb/msid-112525506,width-1070,height-580,imgsize-1776962,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Special Coffee Blend",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                        
                          "A unique blend of flavors just for you!",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Add your button action here
                          },
                          child: const Text(
                            "Order Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
              GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: SizeConfig.isPortrait ? 2 : 3,
                childAspectRatio: SizeConfig.isPortrait ? 0.8 : 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return buildCoffeeCard(index);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
