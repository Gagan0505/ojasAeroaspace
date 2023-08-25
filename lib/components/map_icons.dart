import 'package:flutter/material.dart';
class MapIcons extends StatelessWidget {
  final String imagePath;
  final String labelText;
  const MapIcons({
    required this.imagePath,
    required this.labelText,
    super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 36.0,
          width: 54.0,
          child: ImageIcon(
            AssetImage(imagePath),
            size: 54.0,
           
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}