
import 'package:coffee_app_v2/home_screen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;
  final List<Widget> page = [
    //homescreen
    const HomeScreen(),
    //favorite
    const Center(
      child: Text("favorite",style: TextStyle(
      color: Colors.black
    ),),),
    //add to cart
    const Center(
      child: Text("addto cart",style: TextStyle(
      color: Colors.black
    ),),),
    //notification
    const Center(
      child: Text("notification",style: TextStyle(
      color: Colors.black
    ),),),
    //profile
    const Center(
      child: Text("profile",style: TextStyle(
      color: Colors.black
    ),),),
  ];






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[index],
      bottomNavigationBar:ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30)
        ),
      child:Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.9),
              spreadRadius: 15,
              blurRadius: 17,
              offset: const Offset(0,5),
            )
          ]
        ),
      child:SizedBox(
        height: 80,
      child:BottomNavigationBar(
        
        showSelectedLabels: false,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
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
              color:index == 0 ? const Color(0xFF967259):Colors.grey.withOpacity(0.6),
            )),
          BottomNavigationBarItem(
            label: "favorite",
            icon: Icon(
              Icons.favorite,
              size: 30,
              color:index == 1 ? const Color(0xFF967259):Colors.grey.withOpacity(0.6),
            )),
          BottomNavigationBarItem(
            label: "Add To Cart",
            icon: Icon(
              Icons.shop,
              size: 30,
              color:index == 2 ? const Color(0xFF967259):Colors.grey.withOpacity(0.6),
            )),
          BottomNavigationBarItem(
            label: "Notification",
            icon: Icon(
              Icons.notification_add,
              size: 30,
              color:index == 3 ? const Color(0xFF967259):Colors.grey.withOpacity(0.6),
            )),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person,
              size: 30,
              color:index == 4 ? const Color(0xFF967259):Colors.grey.withOpacity(0.6),
            )),
        ]),

      ),
      )
      )
    );
  }
}