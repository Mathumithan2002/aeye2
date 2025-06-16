/*import 'package:aeye/assets/ScreenTimeChart.dart';
import 'package:flutter/material.dart';
import 'package:aeye/screens/Device.dart';
import 'package:aeye/screens/DrivingMode.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedFeatureIndex = -1;
  int _selectedNavIndex = -1;

  @override
  void initState() {
    super.initState();
    _selectedFeatureIndex = -1;
    _selectedNavIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 206, 190, 174),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(color: const Color.fromARGB(255, 214, 195, 178)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Builder(
                        builder:
                            (context) => IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed:
                                  () => Scaffold.of(context).openDrawer(),
                              color: const Color.fromARGB(255, 33, 32, 32),
                              iconSize: 28,
                            ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFFFDF6EC),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Screen Time",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("2h 45m", style: TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(height: 16),
                  const ScreenTimeChart(),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Center(
                      child: Wrap(
                        spacing: 25,
                        runSpacing: 25,
                        children: [
                          FeatureCard(
                            title: "Device",
                            icon: Icons.devices,
                            width: 150,
                            height: 150,
                            iconSize: 34,
                            fontSize: 16,
                            index: 0,
                            selectedIndex: _selectedFeatureIndex,
                            onTap: () {
                              setState(() => _selectedFeatureIndex = 0);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DevicePage(),
                                ),
                              ).then(
                                (_) =>
                                    setState(() => _selectedFeatureIndex = -1),
                              );
                            },
                          ),
                          FeatureCard(
                            title: "Driving Mode",
                            icon: Icons.directions_car,
                            width: 150,
                            height: 150,
                            iconSize: 34,
                            fontSize: 16,
                            index: 1,
                            selectedIndex: _selectedFeatureIndex,
                            onTap: () {
                              setState(() => _selectedFeatureIndex = 1);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DrivingModePage(),
                                ),
                              ).then(
                                (_) =>
                                    setState(() => _selectedFeatureIndex = -1),
                              );
                            },
                          ),
                          FeatureCard(
                            title: "For Knee Users",
                            icon: Icons.accessibility_new,
                            width: 150,
                            height: 150,
                            iconSize: 34,
                            fontSize: 16,
                            index: 2,
                            selectedIndex: _selectedFeatureIndex,
                            onTap:
                                () => setState(() => _selectedFeatureIndex = 2),
                          ),
                          FeatureCard(
                            title: "Eye Check",
                            icon: Icons.remove_red_eye,
                            width: 150,
                            height: 150,
                            iconSize: 34,
                            fontSize: 16,
                            index: 3,
                            selectedIndex: _selectedFeatureIndex,
                            onTap:
                                () => setState(() => _selectedFeatureIndex = 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 214, 195, 178),
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color:
                      _selectedNavIndex == 0
                          ? const Color(0xFFB99435)
                          : Colors.black,
                  size: 28,
                ),
                onPressed: () => setState(() => _selectedNavIndex = 0),
              ),
              IconButton(
                icon: Icon(
                  Icons.flash_on,
                  color:
                      _selectedNavIndex == 1
                          ? const Color(0xFFB99435)
                          : Colors.black,
                  size: 28,
                ),
                onPressed: () => setState(() => _selectedNavIndex = 1),
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color:
                      _selectedNavIndex == 2
                          ? const Color(0xFFB99435)
                          : Colors.black,
                  size: 28,
                ),
                onPressed: () => setState(() => _selectedNavIndex = 2),
              ),
              IconButton(
                icon: Icon(
                  Icons.dashboard,
                  color:
                      _selectedNavIndex == 3
                          ? const Color(0xFFB99435)
                          : Colors.black,
                  size: 28,
                ),
                onPressed: () => setState(() => _selectedNavIndex = 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 FeatureCard Widget
class FeatureCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final double width;
  final double height;
  final double iconSize;
  final double fontSize;
  final VoidCallback? onTap;
  final int index;
  final int selectedIndex;

  const FeatureCard({
    super.key,
    required this.title,
    required this.icon,
    this.width = 100,
    this.height = 100,
    this.iconSize = 30,
    this.fontSize = 13,
    this.onTap,
    required this.index,
    required this.selectedIndex,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isTapped = false;

  void _handleTap() {
    setState(() => _isTapped = !_isTapped);
    if (widget.onTap != null) widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 44, 43, 43),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: widget.iconSize,
              color:
                  widget.index == widget.selectedIndex
                      ? const Color(0xFFB99435)
                      : Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:aeye/screens/Device.dart';
import 'package:aeye/screens/DrivingMode.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi, Madu',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Keep your eyes safe',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('lib/assets/hacker.jpg'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Tips',
                      suffixIcon: Icon(Icons.tune),
                      contentPadding: EdgeInsets.symmetric(vertical: 15), // Adjust vertical padding to change height
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Features',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View all'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FeatureButton(
                        text: 'Mode',
                        isSelected: true,
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      FeatureButton(
                        text: 'Exercises',
                        isSelected: false,
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      FeatureButton(
                        text: 'Usage',
                        isSelected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView( // Ensure horizontal scroll for feature cards
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FeatureCard(
                        title: 'Driving',
                        subtitle: 'Car/Motor Bikes',
                        rating: '4.8',
                        image: 'lib/assets/driving.jpg',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DrivingModePage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 15),
                      FeatureCard(
                        title: 'Device',
                        subtitle: 'Phone',
                        rating: '4.5',
                        image: 'lib/assets/phone.jpg',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DevicePage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 15),
                      FeatureCard(
                        title: 'Device',
                        subtitle: 'Phone',
                        rating: '4.5',
                        image: 'lib/assets/phone.jpg',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DevicePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: CrystalNavigationBar(
          currentIndex: _selectedNavIndex,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.black.withOpacity(0.5),
          borderWidth: 1,
          outlineBorderColor: Colors.black12,
          onTap: (index) => setState(() => _selectedNavIndex = index),
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.white,
              badge: Badge(
                label: Text(
                  "9+",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.heart,
              unselectedIcon: IconlyLight.heart,
              selectedColor: Colors.red,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.plus,
              unselectedIcon: IconlyLight.plus,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
                icon: IconlyBold.search,
                unselectedIcon: IconlyLight.search,
                selectedColor: Colors.white),
            CrystalNavigationBarItem(
              icon: IconlyBold.user2,
              unselectedIcon: IconlyLight.user3,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

// FeatureButton and FeatureCard classes remain the same


class FeatureButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FeatureButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(15),

          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(-5, -5),
              blurRadius: 20,
            ),

          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rating;
  final String image;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 228,
        height: 405,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, -5),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(5, 5),
              blurRadius: 10,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
