import 'package:eateryapp/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 138, 58, 29),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              // Icon
              Icon(
                Icons.restaurant_menu, // Choose your desired icon
                size: 20, // Set the size of the icon
                color: Colors.black, // Set the color of the icon
              ),
              //shopName
              Text(
                "EATERY RESTAURANT WEB APP",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 49,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: Image.asset(
                    'lib/Images/Restaurant.jpg',
                    width: 600, // Set the desired width of the image
                    height: 180, // Set the desired height of the image
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //title
              Text(
                "For the Best SelfService Restaurant in Town",
                style: GoogleFonts.asar(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),

              //button
              MyButton(
                text: "Let's Get Started",
                onTap: () {
                  //Go to tables details
                  Navigator.pushNamed(context, '/tablepage');
                },
              )
            ],
          ),
        ));
  }
}
