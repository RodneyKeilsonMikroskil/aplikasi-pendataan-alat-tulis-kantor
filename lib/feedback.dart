import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double _rating = 2.5;

  void _submitRating() {
    String message;
    if (_rating < 2.5) {
      message = 'Terima kasih, kami akan berbenah lagi.';
    } else {
      message = 'Terima kasih atas rating Anda.';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Feedback Submitted'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    print('Rating submitted: $_rating');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Rating submitted: $_rating'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        iconTheme: IconThemeData(
          color: isDarkMode
              ? Colors.grey
              : Colors.white, // Ubah warna ikon back button
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Seberapa suka Anda dengan aplikasi kami?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Slider(
              value: _rating,
              onChanged: (newRating) {
                setState(() {
                  _rating = newRating;
                });
              },
              divisions: 10,
              min: 0.0,
              max: 5.0,
              label: _rating.toString(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRating,
              child: const Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }
}
