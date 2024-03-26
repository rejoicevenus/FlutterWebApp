import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eateryapp/components/button.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

final nameController = TextEditingController();
final tablenumberController = TextEditingController();
final numberofguestsController = TextEditingController();

@override
void submitData() {
  // Add data to Firestore
  CollectionReference collRef =
      FirebaseFirestore.instance.collection('tabledetails');
  collRef.add({
    'name': nameController.text,
    'tablenumber': tablenumberController.text,
    'numberofguests': numberofguestsController.text,
  });

  // Clear text controllers after submission
  nameController.clear();
  tablenumberController.clear();
  numberofguestsController.clear();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 58, 29),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 154, 129),
        centerTitle: true,
        title: Text("Table Details",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 49,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: tablenumberController,
              decoration: InputDecoration(
                hintText: 'Table Number',
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: numberofguestsController,
              decoration: InputDecoration(
                hintText: 'Number of Guests',
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              submitData();
            },
            child: Text('Add Customer Details'),
          ),
          const SizedBox(
            height: 90,
          ),
          MyButton(
            text: "Good Job! Press to view Menu",
            onTap: () {
              //Go to tables details
              Navigator.pushNamed(context, '/menupage');
            },
          ),
        ],
      ),
    );
  }
}

@override
void dispose() {
  // Clean up the controllers when the widget is disposed
  nameController.dispose();
  tablenumberController.dispose();
  numberofguestsController.dispose();
}
