import 'package:flutter/material.dart';

import 'dessert.dart';

class DessertShop extends ChangeNotifier {
  final List<Dessert> _dessertmenu = [
    //dessertmenu

    //cakeslices
    Dessert(
        name: "Cake Slice",
        price: "500.00",
        imagePath: "lib/Images/cake slices.jpg",
        rating: "4.5/5"),
    //cupcakes
    Dessert(
        name: "Cupcakes",
        price: "150.00",
        imagePath: "lib/Images/cupcakes.jpg",
        rating: "4.5/5"),
    //brownies
    Dessert(
        name: "Brownies",
        price: "300.00",
        imagePath: "lib/Images/brownies.jpg",
        rating: "4.5/5"),
    //Icecream
    Dessert(
        name: "Icecream",
        price: "300.00",
        imagePath: "lib/Images/Icecream.jpg",
        rating: "4.5/5"),
    //tiramisu
    Dessert(
        name: "Tiramisu",
        price: "800.00",
        imagePath: "lib/Images/tiramisu.jpg",
        rating: "4.5/5"),
    //milkshakes
    Dessert(
        name: 'MilkShake',
        price: '500.00',
        imagePath: 'lib/Images/milkshake.jpg',
        rating: '3.9/5'),
    //water
    Dessert(
        name: 'Bottled Water',
        price: '100.00',
        imagePath: 'lib/Images/water.jpg',
        rating: '4.0/5'),
    //wine
    Dessert(
        name: 'Wine',
        price: '850.00',
        imagePath: 'lib/Images/wine.jpg',
        rating: '4.0/5'),
    //whiskey
    Dessert(
        name: 'Whiskey',
        price: '850.00',
        imagePath: 'lib/Images/whiskey.jpg',
        rating: '3.5/5'),
    //beers
    Dessert(
        name: 'Beeers',
        price: '400.00',
        imagePath: 'lib/Images/Beer.jpg',
        rating: '4.0/5'),
    //tea
    Dessert(
        name: 'Tea',
        price: '300.00',
        imagePath: 'lib/Images/tea.jpg',
        rating: '4.5/5'),
  ];

  //customer basket
  List<Dessert> _basket = [];

  //getter methods
  List<Dessert> get dessertMenu => _dessertmenu;
  List<Dessert> get basket => _basket;

  //add to basket
  void addToBasket(Dessert dessertItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _basket.add(dessertItem);
    }
    notifyListeners();
  }

  //remove from basket
  void removeFromBasket(Dessert food) {
    _basket.remove(food);
    notifyListeners();
  }
}
