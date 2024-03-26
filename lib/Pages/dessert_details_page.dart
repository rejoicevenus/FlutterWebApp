import 'package:eateryapp/models/dessert.dart';
import 'package:eateryapp/models/dessert_shop.dart';
import 'package:flutter/material.dart';
import 'package:eateryapp/components/button.dart';
import 'package:eateryapp/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class dessertDetailsPage extends StatefulWidget {
  final Dessert dessert;
  const dessertDetailsPage({
    super.key,
    required this.dessert,
  });

  @override
  State<dessertDetailsPage> createState() => _dessertDetailsPageState();
}

class _dessertDetailsPageState extends State<dessertDetailsPage> {
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
      final dessertshop = context.read<DessertShop>();

      //add to basket
      dessertshop.addToBasket(widget.dessert, quantityCount);

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
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(children: [
              //image
              Image.asset(
                widget.dessert.imagePath,
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
                  Text(widget.dessert.rating,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),

              const SizedBox(height: 10),

              //foodname
              Text(
                widget.dessert.name,
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
                  '\ksh' + widget.dessert.price,
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
