import 'dart:async';
import 'package:flutter/material.dart';

class WinCertificatePage extends StatefulWidget {
  @override
  _WinCertificatePageState createState() => _WinCertificatePageState();
}

class _WinCertificatePageState extends State<WinCertificatePage> {
  int _seconds = 30;
  late Timer _timer;
  TextEditingController _answerController = TextEditingController();
  bool _isDisabled = false;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
        setState(() {
          _isDisabled = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Win Certificate')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Tell me About Yourself?'),
            TextField(
              controller: _answerController,
              enabled: !_isDisabled,
              decoration: InputDecoration(labelText: 'Enter your answer'),
            ),
            Text('Time remaining: $_seconds seconds'),
            if (_isDisabled)
              ElevatedButton(
                onPressed: () {
                  // Submit the answer logic here
                },
                child: Text('Submit Answer'),
              ),
          ],
        ),
      ),
    );
  }
}
