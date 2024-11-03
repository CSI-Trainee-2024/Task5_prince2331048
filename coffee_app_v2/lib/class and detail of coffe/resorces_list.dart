
import 'package:coffee_app_v2/class%20and%20detail%20of%20coffe/coffeee_class.dart';

const List<String> images = [
  "assets/c2.jpg",
  "assets/c4.jpg",
  "assets/c3.jpg",
  "assets/s1.jpg",
  "assets/p3.jpeg",
  "assets/p4.jpeg",
  "assets/p5.jpeg",
  "assets/s1.jpeg",
  "assets/p6.jpeg",
  "assets/p2.jpeg",
];
const List<String> ratings = [
  "4.2",
  "4.5",
  "4.1",
  "4.0",
  "2.2",
  "3.2",
  "1.2",
  "3.2",
  "3.6",
  "4.8",
];
const List<String> names = [
  "Espresso",
  "Latte",
  "Cappuccino",
  "Cafetiere",
  "Red Eye",
  "Black Eye",
];

const List<String> prices=[
  "₹ 400.20",
  "₹ 500.10",
  "₹ 200.86",
  "₹ 700.56",
  "₹ 100.14",
  "₹ 600.72",
  "₹ 200.66",
  "₹ 700.17",
  "₹ 900.73",
  "₹ 500.66",
];
const List<String> chocolatesType=[
  "white choclate",
  "dark choclate",
  "milk choclate",
];

List<Coffee> allCoffees = [
  Coffee("Espresso", "Rich and creamy", images[0], "₹ 400.20",ratings[0]),
  Coffee("Latte", "Strong and bold", images[1], "₹ 200.20",ratings[1]),
  Coffee("Cappuccino", "with Oat Milk", images[2], "₹ 300.20",ratings[2]),
  Coffee("Cafetiere", "with Chocolate", images[3], "₹ 100.20",ratings[3]),
  Coffee("Red Eye", "with White Milk", images[4], "₹ 150.20",ratings[4]),
  Coffee("Black Eye", "Strong and bold", images[5], "₹ 250.20",ratings[5]),
  
];
