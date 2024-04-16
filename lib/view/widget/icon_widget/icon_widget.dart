import 'package:flutter/material.dart';

Widget iconWidget({
  required IconData icon,
  required Color color,
  required double size,
}) {
  return Icon(
    icon,
    color: color,
    size: size,
  );
}
