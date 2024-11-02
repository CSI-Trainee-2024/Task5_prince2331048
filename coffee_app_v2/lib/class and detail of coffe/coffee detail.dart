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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffee.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.coffee.image,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.coffee.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Price: ${widget.coffee.price}",
              style: TextStyle(fontSize: 20, color: Colors.brown),
            ),
          
            const SizedBox(height: 16),
            Text(
              widget.coffee.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
