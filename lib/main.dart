import 'package:eateryapp/Pages/basket_page.dart';
import 'package:eateryapp/Pages/order_page.dart';
import 'package:eateryapp/Pages/payment_page.dart';
import 'package:eateryapp/models/dessert_shop.dart';
import 'package:eateryapp/models/shop.dart';
import 'package:provider/provider.dart';

import 'Pages/menu_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/intro_page.dart';
import 'Pages/table_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAAKGLG1ooS5HXv3Eo4nGUFRJzRDZUDJPc",
      projectId: "eatery-10399",
      messagingSenderId: "846568231130",
      appId: "1:846568231130:web:332b15f280570408bd55e3",
    ),
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => Shop()), // Your existing provider
      ChangeNotifierProvider(
          create: (context) => DessertShop()), // Add DessertShop provider
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/tablepage': (context) => TablePage(),
        '/menupage': (context) => MenuPage(),
        '/basketpage': (context) => BasketPage(),
        '/paymentpage': (context) => PaymentPage(),
        '/orderpage': (context) => OrderPage(),
      },
    );
  }
}
