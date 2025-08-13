import 'package:flutter/material.dart';

// The main entry point of the app.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarDetailsScreen(),
    );
  }
}

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  // State variables to manage selections
  String? selectedCarType;
  String? selectedTransmission;
  final TextEditingController _vehicleNumberController =
      TextEditingController();

  // Helper widget for the selectable car type cards
  Widget _buildCarTypeCard(
      IconData icon, String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFD300) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: const Color(0xFFE5B500), width: 2)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        backgroundColor: const Color(0xFFFFD300),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Car Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'What type of car do you own?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            // Car Type Selection Grid
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildCarTypeCard(
                  Icons.directions_car, // Placeholder icon
                  'Hatchback',
                  selectedCarType == 'Hatchback',
                  () => setState(() => selectedCarType = 'Hatchback'),
                ),
                _buildCarTypeCard(
                  Icons.directions_car, // Placeholder icon
                  'Sedan',
                  selectedCarType == 'Sedan',
                  () => setState(() => selectedCarType = 'Sedan'),
                ),
                _buildCarTypeCard(
                  Icons.directions_car, // Placeholder icon
                  'SUV Cars',
                  selectedCarType == 'SUV Cars',
                  () => setState(() => selectedCarType = 'SUV Cars'),
                ),
                _buildCarTypeCard(
                  Icons.directions_car, // Placeholder icon
                  'Luxury Cars',
                  selectedCarType == 'Luxury Cars',
                  () => setState(() => selectedCarType = 'Luxury Cars'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Transmission Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Transmission Type Selection Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildCarTypeCard(
                  Icons.build, // Placeholder icon for Manual
                  'Manual',
                  selectedTransmission == 'Manual',
                  () => setState(() => selectedTransmission = 'Manual'),
                ),
                const SizedBox(width: 16),
                _buildCarTypeCard(
                  Icons.build, // Placeholder icon for Automatic
                  'Automatic',
                  selectedTransmission == 'Automatic',
                  () => setState(() => selectedTransmission = 'Automatic'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Vehicle Number',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Vehicle Number Text Field
            TextField(
              controller: _vehicleNumberController,
              decoration: InputDecoration(
                prefixText: 'TN ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 8),
            const Text(
              'We need your vehicle number for your safety only',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 48),
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // This is the key change. We navigate to the RiderApp screen
                  // using Navigator.push when the button is pressed.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiderApp(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD300),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
        SuggestionIcon(icon: Icons.arrow_right_alt, text: 'One way'),
        SuggestionIcon(icon: Icons.refresh, text: 'Round trip'),
        SuggestionIcon(icon: Icons.directions_bus, text: 'Outstation'),
        SuggestionIcon(icon: Icons.calendar_today, text: 'Daily'),
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
              // A placeholder image URL is used since local assets aren't available.
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://placehold.co/600x300',
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
class SuggestionIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const SuggestionIcon({
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
