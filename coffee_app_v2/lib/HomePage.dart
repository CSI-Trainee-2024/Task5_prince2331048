import 'package:coffee_app_v2/bottom%20navigation%20pages/AddToCart.dart';
import 'package:coffee_app_v2/bottom%20navigation%20pages/home_screen.dart';
import 'package:coffee_app_v2/class%20and%20detail%20of%20coffe/coffeee_class.dart';

import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;
  List<Coffee> cartItems = [];

  final List<Widget> page = [];

  @override
  void initState() {
    super.initState();
    page.addAll([
      HomeScreen(onAddToCart: _updateCartItems), 
      const Center(child: Text("Favorite", style: TextStyle(color: Colors.black))),
      Addtocart(cartItems: cartItems),
      const Center(child: Text("Notification", style: TextStyle(color: Colors.black))),
      const Center(child: Text("Profile", style: TextStyle(color: Colors.black))),
    ]);
  }

  void _updateCartItems(Coffee coffee) {
    setState(() {
      cartItems.add(coffee);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[index],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                spreadRadius: 15,
                blurRadius: 17,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              showSelectedLabels: false,
              currentIndex: index,
              onTap: (value) {
                setState(() {
                  index = value;
                  if (index == 2) {
                    page[2] = Addtocart(cartItems: cartItems);
                  }
                });
              },
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFFFFFFFF),
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: index == 0 ? const Color(0xFF967259) : Colors.grey.withOpacity(0.6),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Favorite",
                  icon: Icon(
                    Icons.favorite,
                    size: 30,
                    color: index == 1 ? const Color(0xFF967259) : Colors.grey.withOpacity(0.6),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Add To Cart",
                  icon: Icon(
                    Icons.shop,
                    size: 30,
                    color: index == 2 ? const Color(0xFF967259) : Colors.grey.withOpacity(0.6),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Notification",
                  icon: Icon(
                    Icons.notification_add,
                    size: 30,
                    color: index == 3 ? const Color(0xFF967259) : Colors.grey.withOpacity(0.6),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: index == 4 ? const Color(0xFF967259) : Colors.grey.withOpacity(0.6),
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
