import 'package:eateryapp/components/button.dart';
import 'package:eateryapp/models/food.dart';
import 'package:eateryapp/models/shop.dart';
import 'package:eateryapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Food food;

  const DetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //quantity
  int quantityCount = 0;
  //decreamentquantity

  void decreamentQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increamentquantity

  void increamentQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to basket

  void addToBasket() {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();

      //add to basket
      shop.addToBasket(widget.food, quantityCount);

      //let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Text("Successfully Added to Basket"),
          actions: [
            //okay button
            IconButton(
              onPressed: () {
                //pop once to remove dialog box
                Navigator.pop(context);
                //pop again to go to previous screen
                Navigator.pop(context);
              },

              //pop again to go to previous screen
              icon: Icon(Icons.done),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(children: [
        //ListView of Details
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(children: [
              //image
              Image.asset(
                widget.food.imagePath,
                height: 200,
                width: 800,
              ),
              const SizedBox(height: 25),
              //rating
              Row(
                children: [
                  //star icon
                  const Icon(Icons.star),

                  const SizedBox(width: 5),

                  //rating number
                  Text(widget.food.rating,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 10),

              //foodname
              Text(
                widget.food.name,
                style: GoogleFonts.dmSerifDisplay(fontSize: 38),
              ),
              const SizedBox(height: 15),
            ]),
          ),
        ),

        //price + quantity + add to basket button
        Container(
          color: primaryColor,
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Text(
                  '\ksh' + widget.food.price.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                //quantity
                Row(
                  children: [
                    //minus button
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: decreamentQuantity,
                      ),
                    ),

                    //quantity count
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          quantityCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    //plus button
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: increamentQuantity,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            //add to basket button
            MyButton(text: "Add to Basket", onTap: addToBasket)
          ]),
        ),
      ]),
    );
  }
}
