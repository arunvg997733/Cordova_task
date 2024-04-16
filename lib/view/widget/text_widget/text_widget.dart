import 'package:flutter/material.dart';

Widget textWidget(
    {required String text,
    double? size,
    Color? color,
    FontWeight? weight,
    TextOverflow? overflow}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        overflow: overflow ?? TextOverflow.ellipsis),
  );
}

Widget textWidgetByLine({
  required String text,
  double? size,
  Color? color,
  FontWeight? weight,
}) {
  return Text(
    text,
    maxLines: 3,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight,
    ),
  );
}
