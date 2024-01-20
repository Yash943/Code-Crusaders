import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedSubject = 'Feedback'; // Default subject

  final List<String> subjects = ['Feedback', 'Report Bug in Website', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bckgnd,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),),
        title: const Text('Support'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Subject dropdown
                DropdownButtonFormField<String>(
                  value: _selectedSubject,
                  onChanged: (value) {
                    setState(() {
                      _selectedSubject = value!;
                    });
                  },
                  items: subjects.map((subject) {
                    return DropdownMenuItem(
                      value: subject,
                      child: Text(
                        subject,
                        style:
                            TextStyle(fontSize: 18.0), // Adjust the font size
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                    labelStyle:
                        TextStyle(fontSize: 18.0), // Adjust the font size
                  ),
                ),
                const SizedBox(height: 16.0),

                // Name fields
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    labelStyle:
                        TextStyle(fontSize: 18.0), // Adjust the font size
                  ),
                  style: TextStyle(fontSize: 18.0), // Adjust the font size
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    labelStyle:
                        TextStyle(fontSize: 18.0), // Adjust the font size
                  ),
                  style: TextStyle(fontSize: 18.0), // Adjust the font size
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(fontSize: 18.0), // Adjust the font size
                  ),
                  style: TextStyle(fontSize: 18.0), // Adjust the font size
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),

                // Message field
                TextFormField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Message',
                    labelStyle:
                        TextStyle(fontSize: 18.0), // Adjust the font size
                  ),
                  style:
                      const TextStyle(fontSize: 22.0), // Adjust the font size
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                
                // Rounded Submit button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission here
                      // e.g., send email, display confirmation message
                      print('Subject: $_selectedSubject');
                      print('Name: ${_nameController.text}');
                      print('Email: ${_emailController.text}');
                      print('Message: ${_messageController.text}');
                      _formKey.currentState!
                          .reset(); // Clear fields after submission
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bckgnd,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          40.0), // Adjust the radius as needed
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0), // Adjust the font size
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
