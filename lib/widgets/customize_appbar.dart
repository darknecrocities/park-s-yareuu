import 'package:flutter/material.dart';

class CustomizeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomizeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // ✅ pure white
      foregroundColor: Colors.black, // ✅ ensures icons/text stay black
      elevation: 0, // ✅ removes shadow, super clean look
      titleSpacing: 0,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8.0),
            child: Image.asset(
              'lib/assets/logo_only.jpg',
              width: 40,
              height: 40,
            ),
          ),
          const Text(
            "Park's Yareuu Bistro",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black, // ✅ stays black
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
