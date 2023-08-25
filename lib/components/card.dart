import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const RecommendationCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0, // Adjust the size as needed
      height: 196.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF563E1F),
                  fontSize: 14,
                  fontFamily: 'Mukta',
                  fontWeight: FontWeight.w600,
                  height: 1.54,
                ),
              ),
              const SizedBox(width: 10.0,),
              const Icon(Icons.arrow_forward)
            ],
          ),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF7A7A7A),
              fontSize: 14,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.w400,
              height: 1.54,
            ),
          ),
        ],
      ),
    );
  }
}
