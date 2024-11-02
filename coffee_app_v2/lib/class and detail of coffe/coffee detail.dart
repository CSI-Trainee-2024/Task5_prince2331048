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
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.5,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage(widget.coffee.image),
                          fit: BoxFit.cover,
                        )),
                  ),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.1),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back))),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.1),
                        child: const Icon(Icons.favorite),
                      )
                    ],
                  ),
                ]
                )
              )
            ]
    ),
        )
      )
      );
  }
}
