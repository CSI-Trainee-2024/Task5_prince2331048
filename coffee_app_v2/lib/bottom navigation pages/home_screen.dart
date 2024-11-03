import 'package:coffee_app_v2/class%20and%20detail%20of%20coffe/coffee%20detail.dart';
import 'package:coffee_app_v2/class%20and%20detail%20of%20coffe/coffeee_class.dart';
import 'package:coffee_app_v2/class%20and%20detail%20of%20coffe/resorces_list.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app_v2/circular_icon.dart';
import 'package:coffee_app_v2/size.dart';

class HomeScreen extends StatefulWidget {
  final Function(Coffee) onAddToCart;
  const HomeScreen({Key? key, required this.onAddToCart}) : super(key: key);

  @override

  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
List<Coffee> filteredCoffees = allCoffees;


  void updateSearchQuery(String query) {
    setState(() {
      filteredCoffees = query.isEmpty
          ? allCoffees
          : allCoffees.where((coffee) => coffee.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }
  void _addToCart(Coffee coffee) {
    widget.onAddToCart(coffee); 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${coffee.name} added to cart!'),
      duration: Duration(seconds: 1),),
    );
  }

  int selectedIndex = 0;

  Widget buildCoffeeCard(Coffee coffee) {
      return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoffeeDetailScreen(coffee: coffee),
        ),
      );
    },
  
  child: Card(
    elevation: 5,
    color: Colors.white.withOpacity(0.7),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 118,
              width: double.infinity,
              child: Image.asset(
                coffee.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffee.name,
                style: TextStyle(
                  color: const Color(0xFF444444),
                  fontSize: SizeConfig.blockSizeHorizontal * 3.3,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                coffee.description,
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: SizeConfig.blockSizeHorizontal * 2.2,
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    coffee.price,
                    style: TextStyle(
                      color: const Color(0xFF444444),
                      fontSize: SizeConfig.blockSizeHorizontal * 3.2,
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
                      onPressed: ()=>_addToCart(coffee),
                    ),
                  ),
                ],
              ),
            ],
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
                      prefixIcon: const Icon(Icons.coffee),
                      hintText: "Find Your Coffee...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.brown),
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
                childAspectRatio: SizeConfig.isPortrait ? 0.745 : 0.97,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredCoffees.length > 2 ? 2: filteredCoffees.length,
              itemBuilder: (context, index) {
               
                return buildCoffeeCard(filteredCoffees[index]); 
              },
            ),
            
            const SizedBox(height: 20),
            const Text(
              "Special for you",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              width: SizeConfig.screenWidth * 0.9,
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
                childAspectRatio: SizeConfig.isPortrait ? 0.745 : 0.97,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredCoffees.length, 
              itemBuilder: (context, index) {
                return buildCoffeeCard(filteredCoffees[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

                         
