class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class ShoppingCart {
  Map<Product, int> _items = {};

  void addItem(Product product, int quantity) {
    if (product != null) {
      _items[product] = (_items[product] ?? 0) + quantity;
    }
  }

  void removeItem(Product product, int quantity) {
    if (_items.containsKey(product)) {
      if (_items[product] != null) {
        if (_items[product]! <= quantity) {
          _items.remove(product);
        } else {
          _items[product] = _items[product]! - quantity;
        }
      }
    }
  }

  double getTotalPrice() {
    double total = 0.0;
    _items.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }

  double getTotalPriceWithDiscount() {
    double total = getTotalPrice();
    // Apply discounts here based on quantity or type of items
    // Example discount calculation:
    if (total > 100) {
      total *= 0.9; // 10% discount for total price above $100
    }
    return total;
  }

  void printReceipt() {
    print('=== Receipt ===');
    _items.forEach((product, quantity) {
      print('${product.name} \t x$quantity \t \$${product.price * quantity}');
    });
    print('Total Price: \$${getTotalPrice()}');
    print('Total Price with Discount: \$${getTotalPriceWithDiscount()}');
  }
}

void main() {
  var apple = Product('Apple', 2.0);
  var banana = Product('Banana', 1.0);
  var orange = Product('Orange', 1.5);

  var cart = ShoppingCart();
  
  // Adding items to the cart
  cart.addItem(apple, 6);
  cart.addItem(banana, 2);
  cart.addItem(orange, 1);
  
  // Removing items from the cart
  cart.removeItem(apple, 1);
  cart.removeItem(banana, 1);

  cart.printReceipt();
}
