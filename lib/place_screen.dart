import 'package:flutter/material.dart';
import 'widgets/customize_appbar.dart';
import 'screens/contact_screen.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomizeAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),

            const Text(
              "Private Dining at",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),

            const Text(
              "Park’s Yareuu Bistro - Beverly Hills",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // ===== Private Dining Room =====
            _PlaceCard(
              imagePath: "lib/assets/private_droom.jpg",
              title: "Private Dining Room",
              legends: const [
                _Legend(icon: Icons.people, text: "20 Seated"),
                _Legend(icon: Icons.lock, text: "Private Session"),
                _Legend(icon: Icons.home, text: "Indoor"),
                _Legend(icon: Icons.star, text: "Intimate, Modern, Stylish"),
                _Legend(icon: Icons.thumb_up, text: "Family events, Corporate events"),
              ],
            ),

            const SizedBox(height: 32),

            // ===== Full Restaurant Buyout =====
            _PlaceCard(
              imagePath: "lib/assets/whole_resto.jpg",
              title: "Full Restaurant Buyout",
              legends: const [
                _Legend(icon: Icons.people, text: "200 Seated"),
                _Legend(icon: Icons.lock, text: "Private Session"),
                _Legend(icon: Icons.home, text: "Indoor"),
                _Legend(icon: Icons.star, text: "Intimate, Modern, Stylish"),
                _Legend(icon: Icons.thumb_up, text: "Family Events, Corporate events, Wedding receptions"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Reusable Place Card =====
class _PlaceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final List<_Legend> legends;

  const _PlaceCard({
    required this.imagePath,
    required this.title,
    required this.legends,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 16),

        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        // Legends rows
        Wrap(
          runSpacing: 10,
          spacing: 16,
          children: legends,
        ),

        const SizedBox(height: 24),

        // Request Space Button
        // Inside _PlaceCard widget
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactScreen()),
            );
          },
          child: const Text(
            "Request space",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

// ===== Custom Legend Widget =====
class _Legend extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Legend({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // prevents stretching
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.black),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13, color: Colors.black),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
