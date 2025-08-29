import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';
import '../widgets/customize_appbar.dart';

class ConfirmScreen extends StatefulWidget {
  final String date;
  final String time;

  const ConfirmScreen({
    super.key,
    required this.date,
    required this.time,
  });

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    // Start animation after slight delay
    Timer(const Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomizeAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "\"Table Reservation Confirmed.\"",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ScaleTransition(
              scale: _scaleAnimation,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.red.withOpacity(0.1),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.red,
                  size: 80,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "${widget.date}\n${widget.time}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _goHome,
              child: const Text(
                "Done",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
