import 'package:flutter/material.dart';

class RiderApp extends StatelessWidget {
  const RiderApp({super.key});

  // A helper function to build the recent destination cards.
  Widget _buildRecentDestination(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.access_time),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PVR Cinemas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Pallavaram, Chennai'),
            ],
          ),
        ],
      ),
    );
  }

  // A helper function to build the suggestion icons row.
  Widget _buildSuggestionsRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _SuggestionIcon(icon: Icons.arrow_right_alt, text: 'One way'),
        _SuggestionIcon(icon: Icons.refresh, text: 'Round trip'),
        _SuggestionIcon(icon: Icons.directions_bus, text: 'Outstation'),
        _SuggestionIcon(icon: Icons.calendar_today, text: 'Daily'),
      ],
    );
  }

  // The main build method for the RiderApp screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rider App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFFD300), // Updated color
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Janany,',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Search bar with a rounded border and hint text.
              TextField(
                decoration: InputDecoration(
                  hintText: 'Where to?',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 16),
              // Display recent destinations.
              _buildRecentDestination('PVR Cinemas', 'Pallavaram, Chennai'),
              const SizedBox(height: 8),
              _buildRecentDestination('PVR Cinemas', 'Pallavaram, Chennai'),
              const SizedBox(height: 24),
              const Text(
                'Suggestions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildSuggestionsRow(),
              const SizedBox(height: 24),
              const Text(
                'Drivers around you',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Map image from a local asset with rounded corners.
              // Make sure to add the 'assets/images/' directory and 'map.png' to your pubspec.yaml file.
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'lib/images/map.png',
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
      // The bottom navigation bar with icons and labels.
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFFD300),
        unselectedItemColor: Colors.black,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.percent),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// A separate widget for the suggestion icons to make the code cleaner.
class _SuggestionIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SuggestionIcon({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}
