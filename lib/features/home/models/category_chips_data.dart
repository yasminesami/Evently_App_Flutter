import 'package:flutter/material.dart';

class CategoryChipsData {
  String label;
  IconData icon;
  String? imageLightPath;
  String? imageDarkPath;

  CategoryChipsData(
      {required this.label,
      required this.icon,
      this.imageLightPath,
      this.imageDarkPath});
}
