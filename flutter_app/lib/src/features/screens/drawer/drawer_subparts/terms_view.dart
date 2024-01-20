import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Terms and Conditions"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: bckgnd,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            Text(
              "General Use:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Follow provided instructions and policies for accessing services. Use services only in compliance with the law. No ownership of intellectual property rights. Do not alter legal notices. Content is fetched from various sources, and any issues with missing data should be reported. We may review and remove content that violates policies or the law.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "Privacy Protection:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Agree to the use of personal data in accordance with privacy policies. The service responds to infringement notices promptly.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "Software in Services:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "When software updates are required, it may happen automatically. Users are granted a license for the sole purpose of using the software within the services. Copying, modifying, or reverse engineering is not allowed.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "Modifying and Terminating Services:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Services are subject to constant improvement, and features may be added or removed. Users can discontinue services at any time. If a service is discontinued, reasonable notice will be provided.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "Warranties and Disclaimers:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Services are provided with a commercially reasonable level of skill and care. No specific promises are made about content/offers, functions, or reliability. The services are provided \"as is.\"",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "Liability for Services:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Price Bazzar, its suppliers, and distributors are not responsible for lost profits, revenues, or data. Liability is limited to the amount paid for services. Recognize consumer legal rights in some countries.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TermsAndConditionsContent() {}
}