import 'package:eateryapp/models/shop.dart';
import 'package:eateryapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(child: Text("Thank you for the Order!")),
        const SizedBox(height: 25),
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(25),
            child: Consumer<Shop>(
              builder: (context, shop, child) =>
                  Text(shop.displayCartReceipt()),
            )),
      ]),
    );
  }
}
