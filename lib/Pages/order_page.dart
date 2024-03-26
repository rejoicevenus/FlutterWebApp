import 'package:eateryapp/components/my_receipt.dart';
import 'package:eateryapp/database/firestore.dart';
import 'package:eateryapp/models/shop.dart';
import 'package:eateryapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //if we get to this page,submit order to firestore db
    String receipt = context.read<Shop>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order in Progress"),
        backgroundColor: tertiaryColor,
      ),
      body: Column(children: [MyReceipt()]),
    );
  }
}
