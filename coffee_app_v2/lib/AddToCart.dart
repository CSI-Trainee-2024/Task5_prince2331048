import 'package:coffee_app_v2/cartitemcalss.dart';
import 'package:flutter/material.dart';

class Addtocart extends StatefulWidget {
  final List<CartItem> cartItems;

  const Addtocart({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: widget.cartItems.isEmpty
          ? Center(child: const Text("Your cart is empty."))
          : ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = widget.cartItems[index];

                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: true, // Manage selection state as needed
                          onChanged: (value) {
                            // Handle checkbox change
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            cartItem.coffee.image,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.coffee.name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text("Quantity: ${cartItem.quantity}"),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (cartItem.quantity > 1) {
                                    cartItem.quantity--;
                                  } else {
                                    widget.cartItems.removeAt(index);
                                  }
                                  // Return updated cartItems
                                  Navigator.pop(context, widget.cartItems);
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  cartItem.quantity++;
                                  // Return updated cartItems
                                  Navigator.pop(context, widget.cartItems);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
