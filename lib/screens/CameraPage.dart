import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aeye/screens/face_detection_screen.dart'; // Correct path to the screen
// Import the face detection screen

class DrivingFeatureScreen extends StatelessWidget {
  const DrivingFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A237E), // Deep blue
              Color(0xFF0D47A1), // Lighter blue
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Driving Features',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    _buildFeatureCard(
                      title: 'Face Detection',
                      description: 'Monitor driver alertness and attention',
                      icon: Icons.face,
                      onTap: () => Get.to(() => FaceDetectionScreen()),
                    ),
                    SizedBox(height: 16),
                    _buildFeatureCard(
                      title: 'Speed Monitoring',
                      description: 'Track and analyze driving speed',
                      icon: Icons.speed,
                      onTap: () {
                        // Add navigation for speed monitoring
                      },
                    ),
                    SizedBox(height: 16),
                    _buildFeatureCard(
                      title: 'Route Tracking',
                      description: 'Record and analyze your driving routes',
                      icon: Icons.map,
                      onTap: () {
                        // Add navigation for route tracking
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF1A237E).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: Color(0xFF1A237E),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A237E),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1A237E),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
