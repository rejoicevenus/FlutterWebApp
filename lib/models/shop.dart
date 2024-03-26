import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodmenu = [
    //chips
    Food(
        name: "Chips",
        price: "450.00",
        imagePath: "lib/Images/chips.jpg",
        rating: "4.0/5"),
    //beef curry
    Food(
        name: "Beef Curry",
        price: "950.00",
        imagePath: "lib/Images/beef curry.jpg",
        rating: "4.2/5"),
    //chicken curry
    Food(
        name: "Chicken Curry",
        price: "950.00",
        imagePath: "lib/Images/chicken curry.jpg",
        rating: "4.2/5"),
    //burger
    Food(
        name: "Burger",
        price: "800.00",
        imagePath: "lib/Images/burger (1).jpg",
        rating: "4.0/5"),
    //pizza
    Food(
        name: "Pizza",
        price: "1000.00",
        imagePath: "lib/Images/pizza.jpg",
        rating: "4.3/5"),
    //chapati
    Food(
        name: "Chapati",
        price: "50.00",
        imagePath: "lib/Images/chapati.jpg",
        rating: "3.9/5"),
    //pasta
    Food(
        name: "Pasta",
        price: "1200.00",
        imagePath: "lib/Images/pasta.jpg",
        rating: "4.2/5"),
    //ramen
    Food(
        name: "Ramen",
        price: "1400.00",
        imagePath: "lib/Images/Ramen.jpg",
        rating: "4.3/5"),
    //sushi
    Food(
        name: "Sushi",
        price: "1500.00",
        imagePath: "lib/Images/sushi.jpg",
        rating: "4.0/5"),
    //Ugali
    Food(
        name: "Ugali",
        price: "100.00",
        imagePath: "lib/Images/Ugali.jpg",
        rating: "4.0/5"),
    //fried chicken
    Food(
        name: "Fried Chicken",
        price: "700.00",
        imagePath: "lib/Images/Fried Chicken.jpg",
        rating: "4.0/5"),
  ];

  //customer basket
  List<Food> _basket = [];

  //getter methods
  List<Food> get foodMenu => _foodmenu;

  List<Food> get basket => _basket;

  //add to basket
  void addToBasket(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _basket.add(foodItem);
    }
    notifyListeners();
  }

  //remove from basket
  void removeFromBasket(Food food) {
    _basket.remove(food);
    notifyListeners();
  }

  //get total price of basket
  double getTotalPrice() {
    double total = 0.0;
    for (var item in _basket) {
      total += double.parse(item.price); // Assuming price is stored as a string
    }
    return total;
  }

  //generate receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your Receipt.");
    receipt.writeln();

    //format date to include upto seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('-------------');

    for (final basketItem in _basket) {
      receipt.writeln("${basketItem.name}" "${(basketItem.price)}");
    }
    receipt.writeln("---------------");
    receipt.writeln();
    receipt.writeln("TotalPrice: ${String_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  //for receipt
  String_formatPrice(double price) {
    return "ksh${price.toStringAsFixed(2)}";
  }
}
