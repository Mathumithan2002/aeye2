import 'package:aeye/screens/EmergencyContact.dart';
import 'package:aeye/screens/Heathcare.dart';
import 'package:aeye/screens/Map.dart';
import 'package:aeye/screens/Notification.dart';
import 'package:flutter/material.dart';
import 'package:aeye/screens/History.dart';
import 'package:aeye/screens/face_detection_screen.dart';
import 'package:aeye/screens/face_detection_screen_controller.dart';
import 'package:get/get.dart';
// Ensure this import is correct

class DrivingModePage extends StatelessWidget {
  const DrivingModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 195, 178),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 214, 195, 178),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Select Your Driving Feature",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            DrivingFeatureCard(
              icon: Icons.videocam,
              title: "Start Camera",
              description: "Capture view while driving.",
              onTap: () {
                Get.put(FaceDetectionScreenController());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FaceDetectionScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            DrivingFeatureCard(
              icon: Icons.history,
              title: "History",
              description: "Review previously recorded trips.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            DrivingFeatureCard(
              icon: Icons.notification_add,
              title: "Notifications",
              description: "Customize alerts for road safety.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            DrivingFeatureCard(
              icon: Icons.map,
              title: "Map",
              description: "Find the location.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OSMMapScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            DrivingFeatureCard(
              icon: Icons.health_and_safety,
              title: "Health Care",
              description: "Health Tips Section.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HealthCarePage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            DrivingFeatureCard(
              icon: Icons.contact_emergency,
              title: "Emergency Contact",
              description: "Access or add emergency numbers.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmergencyContactPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DrivingFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const DrivingFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, size: 28, color: Colors.black),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
