import 'package:flutter/material.dart';
import 'coffeee_class.dart';

class Addtocart extends StatefulWidget {
  final List<Coffee> cartItems;

  const Addtocart({super.key, required this.cartItems});

  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  late List<bool> selectedItems; // To track selected items for deletion

  @override
  void initState() {
    super.initState();
    selectedItems = List<bool>.filled(widget.cartItems.length, false);
  }

  void _removeSelectedItems() {
    setState(() {
      for (int i = selectedItems.length - 1; i >= 0; i--) {
        if (selectedItems[i]) {
          widget.cartItems.removeAt(i);
        }
      }
      selectedItems = List<bool>.filled(widget.cartItems.length, false); // Reset selection
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: widget.cartItems.isEmpty
        ? const Center(child: Text('Your cart is empty!', style: TextStyle(fontSize: 20)))
        : SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Your Cart', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.delete, color: Colors.red,),
                        onPressed: _removeSelectedItems,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    itemCount: widget.cartItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildCartCard(widget.cartItems[index], index);
                    },
                  ),
                ],
              ),
            ),
          ),
  );
}


  Widget buildCartCard(Coffee coffee, int index) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Checkbox(
                value: selectedItems[index],
                shape: const CircleBorder(),
              activeColor: Color(0xFF967259),
                onChanged: (bool? value) {
                  setState(() {
                    selectedItems[index] = value!;
                  });
                },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                coffee.image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffee.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(coffee.description, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(coffee.price, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
