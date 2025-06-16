import 'dart:math';
import 'package:flutter/material.dart';

class BlinkRateIndicator extends StatefulWidget {
  final double blinkRate; // 0.0 - 1.0

  const BlinkRateIndicator({super.key, required this.blinkRate});

  @override
  State<BlinkRateIndicator> createState() => _BlinkRateIndicatorState();
}

class _BlinkRateIndicatorState extends State<BlinkRateIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animatedRate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    );

    _animatedRate = Tween<double>(begin: 0, end: widget.blinkRate).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    )..addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlinkRateGauge(rate: _animatedRate.value);
  }
}

class _BlinkRateGauge extends StatelessWidget {
  final double rate;

  const _BlinkRateGauge({required this.rate});

  @override
  Widget build(BuildContext context) {
    final clamped = rate.clamp(0.0, 1.0);
    final totalArc = 5 * pi / 3;
    final startAngle = 2 * pi / 3;
    final angle = startAngle + (totalArc * clamped);
    final percent = (clamped * 100).toStringAsFixed(0);

    final status =
        clamped < 0.33
            ? "Drowsy"
            : clamped < 0.66
            ? "Monitor"
            : "Safe";

    final color =
        clamped < 0.33
            ? Colors.red
            : clamped < 0.66
            ? Colors.orange
            : Colors.green;

    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(240, 240),
            painter: _ShadowArcPainter(), // Arc shadow and color
          ),
          // Eye icon
          Positioned(
            left: 120 + 90 * cos(angle) - 12,
            top: 120 + 90 * sin(angle) - 12,
            child: const Icon(
              Icons.remove_red_eye,
              size: 28,
              color: Colors.black,
            ),
          ),
          // Center info
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$percent%",
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "EYE BLINK RATE",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 6),
              Text(
                status,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShadowArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - 10;
    const strokeWidth = 22.0;

    final shadowPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 50.0
          ..strokeCap = StrokeCap.round
          ..color = Colors.black.withOpacity(0.1)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final arcPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 35.0
          ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final startAngle = 2 * pi / 3;
    final segment = (5 * pi / 3) / 3;

    // 🌑 Draw shadow behind arc
    canvas.drawArc(rect, startAngle, 5 * pi / 3, false, shadowPaint);

    // 🔴 Red arc
    arcPaint.color = Colors.red;
    canvas.drawArc(rect, startAngle, segment, false, arcPaint);

    // 🟠 Orange arc
    arcPaint.color = Colors.orange;
    canvas.drawArc(rect, startAngle + segment, segment, false, arcPaint);

    // 🟢 Green arc
    arcPaint.color = Colors.green;
    canvas.drawArc(rect, startAngle + 2 * segment, segment, false, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
