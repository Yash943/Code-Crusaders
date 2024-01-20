import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
// import 'package:html/dom.dart' as dom;


class PriceTracker extends StatefulWidget {
  @override
  _PriceTrackerState createState() => _PriceTrackerState();
}

class _PriceTrackerState extends State<PriceTracker> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final String url = 'https://www.amazon.in/dp/B07C2VJXP4/';

  // Function to find the price of the product
  Future<double?> findPrice() async {
    final response = await http.get(Uri.parse(url));
    final document = parser.parse(response.body);

    // Find the element with id 'priceblock_ourprice'
    final element = document.getElementById('priceblock_ourprice');
    // return element?.text ?? 'Price Not Found';
    final priceText = element?.text;

    if(priceText == null) {
      print('Price not found');
      return null;
    }
  }

  // Function to format the price
  String formatPrice(String price) {
    // Replace the comma with an empty string
    price = price.replaceAll(',', '');

    // Return the substring starting from index 2
    return price.substring(2);
  }

  // Function to schedule the price tracking every 120 minutes
  void schedulePriceTracking() async {
    final DateTime now = DateTime.now();
    final DateTime next = now.add(Duration(minutes: 120));

    // Wait until the next time
    await Future.delayed(next.difference(now));

    // Call the function recursively
    priceTracker();
  }

  // Function to track the price and store it in Firestore
  void priceTracker() async {
    try{
      // Find the price of the product
      final double? price = await findPrice();

       if (price != null) {
      // Print the price and time to the console
      print(price);
      print(DateTime.now().toLocal());

      // Add the price and time to the Firestore collection 'app'
      db.collection('app').add({
        'price': price,
        'time': DateTime.now().millisecondsSinceEpoch,
      });
    }

      // Format the price
      // final double formattedPrice = formatPrice(price);

      // Print the price and time to the console
      // print(double.parse(formattedPrice));
      // print(DateTime.now().toLocal());

      // Add the price and time to the Firestore collection 'test'
      // db.collection('app').add({
      //   'price': double.parse(formattedPrice),
      //   'time': DateTime.now().millisecondsSinceEpoch,
      // });

      // Schedule the next price tracking
      schedulePriceTracking();
    } catch(e) {
      print("Error: $e");
    }
    
  }

  @override
  void initState() {
    super.initState();
    // Start the price tracking when the app is initialized
    priceTracker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Price Tracker'),
      ),
      body: Center(
        child: Text('Tracking the price of $url'),
      ),
    );
  }
}
