import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.withOpacity(0.85),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(
              Icons.mail_outline,
              size: 80,
              color: Colors.blue.withOpacity(0.85),
            )),
            const SizedBox(height: 20),
            Center(child: Container(
              height: 1.0,
              width: 250,
              color: Colors.red,
            )),
            const SizedBox(height: 10),
            Center(child: Text(
              'Menu Data ATK',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple.withOpacity(0.55),
              ),
            )),
            const SizedBox(height: 10),
            Center(child: Container(
              height: 1.0,
              width: 325,
              color: Colors.red,
            )),
            const SizedBox(height: 10),
            ContactItem(
              name: 'Akbar Serdano',
              contact: '+62852XXXXX',
              type: 'WA',
            ),
            ContactItem(
              name: 'Akbar Serdano',
              contact: '+62852XXXXX',
              type: 'WA',
            ),
            ContactItem(
              name: 'Akbar Serdano',
              contact: '+62852XXXXX',
              type: 'WA',
            ),
            const SizedBox(height: 16.0),
            Center(child: Container(
              height: 1.0,
              width: 200,
              color: Colors.grey[300],
            )),
          ],
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String name;
  final String contact;
  final String type;

  ContactItem({
    required this.name,
    required this.contact,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$name\n$type',
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Spacer(),
          Text(
            contact,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
