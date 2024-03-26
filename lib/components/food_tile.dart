import 'package:eateryapp/models/food.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 223, 154, 129),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //image
            Image.asset(
              food.imagePath,
              height: 100,
            ),
            //Text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //price + rating

            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    '\ksh' + food.price,
                  ),

                  //rating
                  Row(
                    children: [
                      const Icon(Icons.star),
                      Text(
                        food.rating,
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
