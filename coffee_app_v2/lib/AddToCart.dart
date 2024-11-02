import 'package:flutter/material.dart';
import 'coffeee_class.dart';

class Addtocart extends StatefulWidget {
  final List<Coffee> cartItems;

  const Addtocart({super.key, required this.cartItems});

  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  late List<bool> selectedItems; 

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
      selectedItems = List<bool>.filled(widget.cartItems.length, false); 
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      widget.cartItems[index].quantity++; 
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (widget.cartItems[index].quantity > 1) {
        widget.cartItems[index].quantity--;
      }
    });
  }
    int get_total_itemcount(){
    int totalCount = 0;
    for (var coffee in widget.cartItems){
      totalCount += coffee.quantity;
    }
    return totalCount;
  }
double convertPriceStringToDouble(String priceString) {
  try {
    // Remove any currency symbols or commas if necessary
    String sanitizedString = priceString.replaceAll(RegExp(r'[\$,]'), '');
    return double.parse(sanitizedString);
  } catch (e) {
    print("Error parsing price: $e");
    return 0.0; // Return a default value in case of error
  }
}
double getTotalAmount() {
  double totalAmount = 0.0;
  for (var coffee in widget.cartItems) {
    totalAmount += convertPriceStringToDouble(coffee.price) * coffee.quantity;
  }
  return totalAmount;
}


  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text('Your Cart', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: _removeSelectedItems,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Items(${get_total_itemcount()})', 
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 10),
            Expanded(
              child:widget.cartItems.isEmpty
                ? const Center(
                    child: Text(
                      'Your cart is empty!',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : 
          
                    ListView.builder(
                      itemCount: widget.cartItems.length,
                      itemBuilder: (context, index) {
                        return buildCartCard(widget.cartItems[index], index);
                      },
                    ),
            ),  
              Text(
            'Total Amount: ${getTotalAmount().toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),  
          ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                                    
                    Text(coffee.price, style: const TextStyle(fontSize: 14)),
              
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF967259)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove, size: 15),
                            onPressed: () => _decrementQuantity(index),
                            padding: EdgeInsets.zero, 
                          ),
                        ),
                        const SizedBox(width: 5), 
                        Text("${coffee.quantity}", style: const TextStyle(fontSize: 14)),
                        const SizedBox(width: 5),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF967259)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, size: 15),
                            onPressed: () => _incrementQuantity(index),
                            padding: EdgeInsets.zero, 
                          ),
                        ),
                      ],
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
}