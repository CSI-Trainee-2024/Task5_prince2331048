import 'package:flutter/material.dart';
import 'package:coffee_app_v2/circular_icon.dart';
import 'package:coffee_app_v2/resorces_list.dart'; // Ensure this contains names, images, etc.
import 'package:coffee_app_v2/size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> filteredNames = names;
  List<String> filteredImages = images;
  String searchQuery = '';

void updateSearchQuery(String query) {
  setState(() {
    searchQuery = query;

    if (searchQuery.isEmpty) {
      // Reset to show all coffee items when the search query is empty
      filteredNames = names;
      filteredImages = images;
    } else {
      // Filter coffee items based on the search query
      filteredNames = names
          .where((name) => name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();

      // Update images based on filtered names
      filteredImages = images
          .asMap()
          .entries
          .where((entry) => filteredNames.contains(names[entry.key]))
          .map((entry) => entry.value)
          .toList();
    }
  });
}


  int selectedIndex = 0;

  Widget buildCoffeeCard(int index) {
  return Card(
    elevation: 5,
    color: Colors.white.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 118,
            width: double.infinity,
            child: Image.asset(
              filteredImages[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                filteredNames[index],
                style: TextStyle(
                  color: const Color(0xFF444444),
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                descriptions[names.indexOf(filteredNames[index])],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 2.5,
                ),
              ),
              // Row for price and add button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    prices[names.indexOf(filteredNames[index])],
                    style: TextStyle(
                      color: const Color(0xFF444444),
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.brown,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        // Implement your add action here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${filteredNames[index]} added to cart!'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    if (names.isEmpty || descriptions.isEmpty || ratings.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
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
                  child: TextField(
                    onChanged: updateSearchQuery,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.coffee),
                      hintText: "Find Your Coffee...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                      filled: true,
                      fillColor: Colors.brown.withOpacity(0.1),
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
            const SizedBox(height: 5),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: SizeConfig.isPortrait ? 2 : 3,
                childAspectRatio: SizeConfig.isPortrait ? 0.8 : 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredNames.length, // Use filteredNames to determine item count
              itemBuilder: (context, index) {
                int originalIndex = names.indexOf(filteredNames[index]); // Get the original index
                return buildCoffeeCard(originalIndex); // Pass original index to buildCoffeeCard
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
              itemCount: filteredNames.length, // Updated to use filteredNames
              itemBuilder: (context, index) {
                return buildCoffeeCard(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

                         
