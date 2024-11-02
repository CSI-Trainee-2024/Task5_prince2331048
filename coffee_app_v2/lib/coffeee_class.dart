class Coffee {
  final String name;
  final String description;
  final String image;
  final String price;
  int quantity; // Added quantity property

  Coffee(this.name, this.description, this.image, this.price, {this.quantity = 1}); // Default quantity is 1

  // Getter for quantity
  int getQuantity() {
    return quantity;
  }

  // Setter for quantity
  void setQuantity(int newQuantity) {
    quantity = newQuantity;
  }
}
