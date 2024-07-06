import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
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
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.grey : Colors.white,
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
            Center(
                child: Icon(
              Icons.mail_outline,
              size: 80,
              color: isDarkMode
                  ? const Color.fromARGB(255, 64, 64, 64)
                  : Colors.blue,
            )),
            const SizedBox(height: 20),
            Center(
                child: Container(
              height: 1.0,
              width: 250,
              color: isDarkMode
                  ? const Color.fromARGB(255, 64, 64, 64)
                  : Colors.blue,
            )),
            const SizedBox(height: 10),
            Center(
                child: Text('Contact Person',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? const Color.fromARGB(255, 64, 64, 64)
                          : Colors.blue,
                    ))),
            const SizedBox(height: 10),
            Center(
                child: Container(
              height: 1.0,
              width: 325,
              color: isDarkMode
                  ? const Color.fromARGB(255, 64, 64, 64)
                  : Colors.blue,
            )),
            const SizedBox(height: 10),
            const ContactItem(
              name: 'Rodney Keilson',
              contact: '+62852XXXXXX',
              type: 'WA',
            ),
            const ContactItem(
              name: 'Felix Willie',
              contact: '+62852XXXXXX',
              type: 'WA',
            ),
            const ContactItem(
              name: 'Irfandi',
              contact: '+62852XXXXXX',
              type: 'WA',
            ),
            const SizedBox(height: 16.0),
            Center(
                child: Container(
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

  const ContactItem({
    super.key,
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
