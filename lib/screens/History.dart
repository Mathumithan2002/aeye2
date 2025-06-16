import 'package:flutter/material.dart';
import 'package:aeye/assets/BlinkRateIndicator.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double eyeBlinkRate = 0.92;

    return Scaffold(
      backgroundColor: const Color(0xFFD6C3B2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6C3B2),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Container(
          width: 280,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFD6C3B2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "Eye Blink History",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 📊 Eye Blink Circular Indicator
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: BlinkRateIndicator(blinkRate: eyeBlinkRate),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today’s Summary",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),

            // 📋 Stats
            const SummaryTile(
              icon: Icons.timelapse,
              title: "Total Trips",
              value: "10",
            ),

            // 📋 Grouped Stats Container with no spacing between boxes
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 225, 212),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  Divider(height: 2, color: Colors.black26),
                  SummaryTile(
                    icon: Icons.remove_red_eye,
                    title: "Avg Blinks/Minute",
                    value: "15",
                  ),
                  Divider(height: 1, color: Colors.black26),
                  SummaryTile(
                    icon: Icons.access_time,
                    title: "Driving Time",
                    value: "1h 30m",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Space between boxes
            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add graph navigation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("View Graph", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Custom ListTile for Summary
class SummaryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const SummaryTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: const Color.fromARGB(255, 240, 225, 212),
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
      trailing: Text(
        value,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
