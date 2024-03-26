import 'package:eateryapp/components/button.dart';
import 'package:eateryapp/models/food.dart';
import 'package:eateryapp/models/shop.dart';
import 'package:eateryapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});
  //remove from Basket
  void removeFromBasket(Food food, BuildContext context) {
    //get access to the shop
    final shop = context.read<Shop>();

    //remove from Cart
    shop.removeFromBasket(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 138, 58, 29),
        appBar: AppBar(
          title: Text(
            "My Basket",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          elevation: 0,
          backgroundColor: secondaryColor,
        ),
        body: Column(
          children: [
            //CUSTOMER CART
            Expanded(
              child: ListView.builder(
                  itemCount: value.basket.length,
                  itemBuilder: (context, index) {
                    //get food from basket
                    final Food food = value.basket[index];

                    //get food name
                    final String foodName = food.name;

                    //get food price
                    final String foodPrice = food.price;

                    //get food image
                    final String foodImagePath = food.imagePath;

                    //return list title
                    return Container(
                      decoration: BoxDecoration(
                          color: tertiaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: ListTile(
                        leading: Image.asset(
                          foodImagePath,
                          width: 70, // adjust the width as needed
                          height: 70, // adjust the height as needed
                          fit: BoxFit.cover, // adjust the fit as needed
                        ),
                        title: Text(
                          foodName,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(foodPrice),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removeFromBasket(food, context),
                        ),
                      ),
                    );
                  }),
            ),
            //PAY BUTTON
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                  text: "CheckOut and Pay",
                  onTap: () => Navigator.pushNamed(context, '/paymentpage')),
            )
          ],
        ),
      ),
    );
  }
}
