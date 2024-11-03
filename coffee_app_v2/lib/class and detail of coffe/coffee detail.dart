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
                                  bottomRight: Radius.circular(40)),
                              image: DecorationImage(
                                image: AssetImage(widget.coffee.image),
                                fit: BoxFit.cover,
                              )),
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
                                  icon: const Icon(Icons.arrow_back))),
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
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                ),
                                color:  Colors.white.withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        widget.coffee.description,
                                        style: const TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
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
                                  )
                                ],
                              ),
                            ))
                      ])),
                )
              ]),
            )));
  }
}
