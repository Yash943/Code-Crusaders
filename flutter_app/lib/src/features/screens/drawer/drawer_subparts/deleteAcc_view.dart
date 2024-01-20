import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  _DeleteAccountScreenState createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your password to delete your account',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _deleteAccount();
              },
              child: const Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteAccount() {
    // You should replace this with actual backend logic to delete the account
    String password = _passwordController.text;

    // Make API request to delete the account
    // For example, you might use a package like http or dio to make HTTP requests
    // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint for deleting the account
    // Also, send the password securely, preferably using HTTPS
    // This is just a basic example and does not handle real-world security concerns
    // Always make sure to implement secure practices in your production code.
    // Example:
    /*
    http.post('YOUR_API_ENDPOINT', body: {
      'password': password,
    }).then((response) {
      // Handle the response from the server
      if (response.statusCode == 200) {
        // Account deleted successfully
        Navigator.pop(context, true); // Navigate back with success indicator
      } else {
        // Handle error from the server
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete account. Please try again.'),
          ),
        );
      }
    }).catchError((error) {
      // Handle other errors
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    });
    */
  }
}