import 'package:flutter/material.dart';

class PriceAlerts extends StatefulWidget {
  const PriceAlerts({super.key});

  @override
  State<PriceAlerts> createState() => PriceAlertsState();
}

class PriceAlertsState extends State<PriceAlerts> {
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff94a5f7),
        automaticallyImplyLeading: false,
        // leading: GestureDetector(
        //     onTap: () => Navigator.of(context).pop(),
        //     child: const Icon(
        //       Icons.arrow_back_ios,
        //       size: 22,
        //       color: Color.fromARGB(255, 255, 255, 255),
        //     )),
        title: const Text(
          'Price Alerts',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'ADLaMDisplay',
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              'Whoops! No Products to show',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ADLaMDisplay',
                  color: Color(0xff333333)),
            ),
            const Text(
              'Your price alerts will appear here',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff333333)),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                  radius: 130,
                  backgroundColor: const Color(0xff94a5f7).withOpacity(0.3),
                  child: Image.asset(
                    'assets/images/empty.cart.png',
                    width: 270,
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}