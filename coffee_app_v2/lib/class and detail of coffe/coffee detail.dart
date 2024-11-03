import 'package:coffee_app_v2/class%20and%20detail%20of%20coffe/resorces_list.dart';
import 'package:coffee_app_v2/size.dart';
import 'package:flutter/material.dart';
import 'coffeee_class.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final Coffee coffee;

  const CoffeeDetailScreen({Key? key, required this.coffee}) : super(key: key);

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  int selectedChocolateType = 0; // Initialize with default selection
  String selectedSize = "S"; // Default size selection

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.5,
                child: Stack(children: [
                  Container(
                    height: 420,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.coffee.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.01),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: SizeConfig.screenWidth * 0.1),
                        child: const Icon(Icons.favorite),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: SizeConfig.screenHeight * 0.0425,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.01,
                                ),
                                Text(
                                  widget.coffee.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.01,
                                ),
                                Text(
                                  widget.coffee.description,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.01,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      widget.coffee.ratings,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '(8,590)',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.coffee.price,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.01,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text(
                    widget.coffee.description,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text(
                    "Choice of Chocolates",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Container(
                    height: SizeConfig.screenHeight * 0.05,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedChocolateType = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.brown),
                              borderRadius: BorderRadius.circular(10),
                              color: selectedChocolateType == index
                                  ? Colors.brown
                                  : Colors.transparent,
                            ),
                            child: Text(
                              chocolatesType[index],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: SizeConfig.screenWidth * 0.06,
                        );
                      },
                      itemCount: chocolatesType.length,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = "S";
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: SizeConfig.screenWidth * 0.12,
                                  width: SizeConfig.screenWidth * 0.12,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.brown),
                                    borderRadius: BorderRadius.circular(100),
                                    color: selectedSize == "S"
                                        ? Colors.brown
                                        : Colors.transparent,
                                  ),
                                  child: Text("S"),
                                ),
                              ),
                              SizedBox(width: SizeConfig.screenWidth * 0.04),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = "M";
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: SizeConfig.screenWidth * 0.12,
                                  width: SizeConfig.screenWidth * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: Colors.brown),
                                    color: selectedSize == "M"
                                        ? Colors.brown
                                        : Colors.transparent,
                                  ),
                                  child: Text("M"),
                                ),
                              ),
                              SizedBox(width: SizeConfig.screenWidth * 0.04),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = "L";
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: SizeConfig.screenWidth * 0.12,
                                  width: SizeConfig.screenWidth * 0.12,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.brown),
                                    borderRadius: BorderRadius.circular(100),
                                    color: selectedSize == "L"
                                        ? Colors.brown
                                        : Colors.transparent,
                                  ),
                                  child: Text("L"),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
