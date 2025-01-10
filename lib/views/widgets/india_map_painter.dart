import 'package:bpp_frontend/models/state_boundaries.dart';
import 'package:flutter/material.dart';

class IndiaMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue[200]!
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Draw each state
    for (var state in statesPaths) {
      final path = Path();

      // Scale the coordinates to fit the canvas
      final scaledPoints = state.points.map((point) {
        return Offset(
          point.dx * size.width,
          point.dy * size.height,
        );
      }).toList();

      // Create the state boundary path
      path.moveTo(scaledPoints[0].dx, scaledPoints[0].dy);
      for (var i = 1; i < scaledPoints.length; i++) {
        path.lineTo(scaledPoints[i].dx, scaledPoints[i].dy);
      }
      path.close();

      // Draw the state
      canvas.drawPath(path, paint);
      canvas.drawPath(path, borderPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
