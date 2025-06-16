import 'package:camera/camera.dart';
import 'package:aeye/screens/face_detection_screen_controller.dart'; // Corrected import path
import 'package:flutter/material.dart';
import 'package:flutter_uvc_camera/flutter_uvc_camera.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:aeye/screens/advanced_settings_screen.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  // Ensures the controller is fetched correctly using GetX
  final FaceDetectionScreenController _controller =
      Get.find<FaceDetectionScreenController>();

  Widget _buildCameraPreview() {
    return GetBuilder<FaceDetectionScreenController>(
      builder: (controller) {
        if (!controller.isCameraInitialized) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.isExternalCamera) {
          return UVCCameraView(
            cameraController:
                controller
                    .uvcCamera!, // Assumes the camera controller is properly initialized
            width: 300,
            height: 300,
          );
        } else {
          return CameraPreview(
            controller.cameraController!,
          ); // Show the camera preview
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Sleep Detection'),
        backgroundColor: Color.fromARGB(255, 206, 190, 174),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Top half: Camera view (Wrapped in GetBuilder to show the camera once initialized)
          Expanded(
            flex: 3, // Increased height here for the camera section
            child: Container(
              color: Colors.white, // Set the background color to white
              child: _buildCameraPreview(),
            ),
          ),
          // Bottom half: Status, Start/Stop button, settings
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                // Status text at the top center
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Obx(() {
                    Logger().e(_controller.detectionStatus.value);
                    return Text(
                      'Status: ${_controller.detectionStatus.value}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                ),
                // Centered Start/Stop button
                Center(
                  child: GetBuilder<FaceDetectionScreenController>(
                    builder: (controller) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_controller.isDetecting) {
                            _controller.stopDetection();
                          } else {
                            _controller.startDetection();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 206, 190, 174),
                          foregroundColor: Colors.black,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(40),
                          elevation: 5,
                        ),
                        child: Text(
                          _controller.isDetecting ? 'Stop' : 'Start',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Advanced Settings icon button in the bottom-right corner
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => const AdvancedSettingsScreen());
                    },
                    icon: const Icon(Icons.settings),
                    color: Color.fromARGB(255, 206, 190, 174),
                    iconSize: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
