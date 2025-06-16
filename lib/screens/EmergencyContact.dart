import 'package:flutter/material.dart';

class EmergencyContactPage extends StatefulWidget {
  const EmergencyContactPage({super.key});

  @override
  State<EmergencyContactPage> createState() => _EmergencyContactPageState();
}

class _EmergencyContactPageState extends State<EmergencyContactPage> {
  // Sample emergency contacts
  List<Map<String, String>> emergencyContacts = [
    {'name': 'John Doe', 'phone': '123-456-7890', 'relationship': 'Brother'},
    {'name': 'Jane Smith', 'phone': '987-654-3210', 'relationship': 'Mother'},
  ];

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _relationshipController = TextEditingController();

  // Function to add a new emergency contact
  void _addEmergencyContact() {
    setState(() {
      emergencyContacts.add({
        'name': _nameController.text,
        'phone': _phoneController.text,
        'relationship': _relationshipController.text,
      });
    });

    // Clear the text fields after adding
    _nameController.clear();
    _phoneController.clear();
    _relationshipController.clear();
  }

  // Function to open the form dialog
  void _openAddContactDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(
            255,
            208,
            196,
            184,
          ), // Background color for the dialog
          title: const Text(
            'Add Emergency Contact',
            style: TextStyle(
              color: Color.fromARGB(255, 27, 26, 25),
              fontSize: 18,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 27, 26, 25)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 27, 26, 25),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 27, 26, 25)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 27, 26, 25),
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: _relationshipController,
                decoration: const InputDecoration(
                  labelText: 'Relationship',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 34, 34, 35)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 17, 16, 17),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color.fromARGB(255, 27, 26, 25)),
              ),
            ),
            TextButton(
              onPressed: () {
                _addEmergencyContact();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Color.fromARGB(255, 27, 26, 25)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 195, 178),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 214, 195, 178),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Emergency Contact",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // List of emergency contacts
            Expanded(
              child: ListView.builder(
                itemCount: emergencyContacts.length,
                itemBuilder: (context, index) {
                  final contact = emergencyContacts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Rounded corners for cards
                    ),
                    elevation: 5, // Shadow effect
                    color: const Color.fromARGB(
                      255,
                      187,
                      176,
                      166,
                    ), // Card background color
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: CircleAvatar(
                        radius: 25, // Size of the profile icon
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person, // Default profile icon
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        contact['name']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${contact['relationship']} - ${contact['phone']}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Button to add new emergency contact - lifted from the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ), // Adjust the padding to lift the button
                child: ElevatedButton(
                  onPressed: _openAddContactDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                      255,
                      187,
                      176,
                      166,
                    ), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ), // Rounded corners for button
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                  ),
                  child: const Text(
                    'Add Emergency Contact',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
