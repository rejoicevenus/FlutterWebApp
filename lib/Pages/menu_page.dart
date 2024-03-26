import 'package:eateryapp/Pages/dessert_details_page.dart';
import 'package:eateryapp/Pages/details_page.dart';
import 'package:eateryapp/components/dessert_tile.dart';
import 'package:eateryapp/components/food_tile.dart';
import 'package:eateryapp/models/dessert_shop.dart';
import 'package:eateryapp/models/shop.dart';
import 'package:eateryapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToDetails(int index) {
    //get the shop and its menu
    final shop = context.read<Shop>();
    final foodmenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          food: foodmenu[index],
        ),
      ),
    );
  }

  void navigateTodessertDetails(int index) {
    //get shop and its menu
    final dessertshop = context.read<DessertShop>();
    final dessertmenu = dessertshop.dessertMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => dessertDetailsPage(
          dessert: dessertmenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodmenu = shop.foodMenu;
    //get shop and its menu
    final dessertshop = context.read<DessertShop>();
    final dessertmenu = dessertshop.dessertMenu;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 58, 29),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 154, 129),
        title: Text(
          'Menu',
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          //basket button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/basketpage');
              },
              icon: Icon(Icons.shopping_basket))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //Banner
        Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Eatery Restaurant Menu',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.restaurant_menu, // Choose your desired icon
                size: 40, // Set the size of the icon
                color: Colors.black,
              ),
            ],
          ),
        ),

        //menulist

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Food Menu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodmenu.length,
            itemBuilder: (context, index) => FoodTile(
              food: foodmenu[index],
              onTap: () => navigateToDetails(index),
            ),
          ),
        ),

        //dessert menu

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Dessert & Drinks Menu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dessertmenu.length,
            itemBuilder: (context, index) => DessertTile(
              dessert: dessertmenu[index],
              onTap: () => navigateTodessertDetails(index),
            ),
          ),
        ),
      ]),
    );
  }
}
