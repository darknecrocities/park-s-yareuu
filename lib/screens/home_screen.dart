import 'package:flutter/material.dart';
import '../widgets/customize_appbar.dart';
import 'package:park/place_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedTab = 0;
  String _selectedPeople = '2 people';
  String _selectedDate = 'Aug 28, 2025';

  final List<String> peopleOptions = ['1 person', '2 people', '3 people', '4 people'];
  final List<String> dateOptions = ['Aug 28, 2025', 'Aug 29, 2025', 'Aug 30, 2025'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomizeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image
            Image.asset(
              'lib/assets/home_screen.jpg',
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 12),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Park's Yareuu Bistro - Beverly Hills",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 8),

            // Single black star icon and rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  Icon(Icons.star, color: Colors.black, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "4.9 (1987) • \$69 and over • Korean Bistro",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Address
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  Icon(Icons.location_pin, size: 20),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      "1897 Aurora Blvd, Beverly Hills, CA 90210-2728",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Make a reservation section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Make a reservation",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),

                  // People dropdown (top)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedPeople,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: peopleOptions
                          .map((e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            const Icon(Icons.person, size: 18), // Person icon
                            const SizedBox(width: 8),
                            Text(e),
                          ],
                        ),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPeople = value!;
                        });
                      },
                    ),
                  ),


                  const SizedBox(height: 16),

                  // Date dropdown (bottom) with icon
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedDate,
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.calendar_today, color: Colors.black),
                      items: dateOptions
                          .map((e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 18),
                            const SizedBox(width: 8),
                            Text(e),
                          ],
                        ),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDate = value!;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Time slots
                  // Time slots label
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Select a Time",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

// Time slots
                  Row(
                    children: [
                      _timeSlot("1:00 PM"),
                      const SizedBox(width: 8),
                      _timeSlot("2:30 PM"),
                      const SizedBox(width: 8),
                      _timeSlot("6:00 PM"),
                      const SizedBox(width: 8),
                      _notifyButton(),
                    ],
                  ),


                  const SizedBox(height: 12),

                  // Stats
                  Row(
                    children: const [
                      Icon(Icons.bar_chart, size: 20),
                      SizedBox(width: 8),
                      Text("Booked 87 times today"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.access_time, size: 20),
                      SizedBox(width: 8),
                      Text("You're in Luck! We still have 4 timeSlots left"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _tabButton("Overview", 0),
                _tabButton("Private Dining", 1),
                _tabButton("Popular Dishes", 2),
                _tabButton("Photos", 3),
              ],
            ),

            const Divider(height: 24, thickness: 1),

            // Overview content
            if (_selectedTab == 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About this restaurant",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 10,       // horizontal spacing between items
                      runSpacing: 8,     // vertical spacing between lines
                      children: [
                        _keywordBox("Great for special occasions"),
                        _keywordBox("Romantic"),
                        _keywordBox("Pet-Friendly"),
                        _keywordBox("Cozy & intimate"),
                        _keywordBox("Fresh & flavorful"),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Parks Yareuu Restaurant is a welcoming dining destination where "
                          "flavor, comfort, and community come together. Known for its warm "
                          "atmosphere and attentive service, Parks Yareuu offers guests an "
                          "experience that blends quality cuisine with a sense of home. "
                          "Our menu is carefully crafted to satisfy every palate.",
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Additional information",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),

                    _infoRow(Icons.location_pin, "Location", "1897 Aurora Blvd, Beverly Hills, CA 90210-2728",subtitleColor: Colors.red),
                    _infoRow(Icons.home, "Neighborhood", "Beverly Hills"),
                    _infoRow(Icons.local_parking, "Parking details", "Valet"),
                    _infoRow(Icons.attach_money, "Price", "\$69 and over"),
                    _infoRow(Icons.restaurant, "Cuisines", "Korean, Bistro, Noodles, Rice"),
                    _infoRow(Icons.add, "Additional", "Bar/Lounge, Private Room, Non-Smoking, Vegan Options, Gluten-free Options, Gender Neutral Restroom, Beer"),
                  ],
                ),
              ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Time slot button
  Widget _timeSlot(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        time,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // Notify me button
  Widget _notifyButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: const Text("Notify Me", style: TextStyle(color: Colors.black)),
    );
  }

  // Tabs button
  // Tabs button
  Widget _tabButton(String title, int index) {
    bool selected = _selectedTab == index;

    return GestureDetector(
      onTap: () {
        if (title == "Private Dining") {
          // Navigate to PlaceScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PlaceScreen()),
          );
        } else {
          setState(() {
            _selectedTab = index;
          });
        }
      },
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.red : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


  // Keywords box
  Widget _keywordBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  // Additional info row
  Widget _infoRow(IconData icon, String title, String subtitle, {Color subtitleColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "$title\n",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: subtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: subtitleColor, // 👈 dynamic color here
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
