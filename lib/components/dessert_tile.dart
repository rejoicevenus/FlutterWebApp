import 'package:eateryapp/models/dessert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DessertTile extends StatelessWidget {
  final Dessert dessert;
  final void Function()? onTap;

  const DessertTile({
    super.key,
    required this.dessert,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 223, 154, 129),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //image
            Image.asset(
              dessert.imagePath,
              height: 100,
            ),
            //Text
            Text(
              dessert.name,
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
                    '\ksh' + dessert.price,
                  ),

                  //rating
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text(
                        dessert.rating,
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
