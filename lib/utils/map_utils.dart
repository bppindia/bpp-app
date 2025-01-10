import 'package:flutter/material.dart';

class MapUtils {
  static bool isPointWithinMap(Offset point, Size imageSize) {
    final double relativeX = point.dx / imageSize.width;
    final double relativeY = point.dy / imageSize.height;

    if (relativeY < 0.1 || relativeY > 0.9) return false;
    if (relativeX < 0.1 || relativeX > 0.9) return false;

    if (relativeX < 0.2 && relativeY < 0.3) return false;
    if (relativeX > 0.8 && relativeY < 0.2) return false;
    if (relativeX < 0.2 && relativeY > 0.7) return false;
    if (relativeX > 0.8 && relativeY > 0.7) return false;

    return true;
  }
}
