import 'package:flutter/material.dart';

class HealthCarePage extends StatelessWidget {
  const HealthCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Health Care")),
      body: const Center(
        child: Text("Health tips and emergency suggestions will appear here."),
      ),
    );
  }
}
