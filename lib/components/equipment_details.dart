import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String imagePath;
  final String equipment;
  final String description;
  final String price;
  const DetailCard({super.key, 
    required this.imagePath,
    required this.equipment,
    required this.description,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 54.0, // Adjust the size as needed
            height: 36.0,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                            text: equipment,
                            style: const TextStyle(
                            color: Color(0xFF563E1F),
                            fontSize: 14,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w600,
                            height: 1.54,
                            ),
                            ),
                            TextSpan(
                            text: description,
                            style: const TextStyle(
                            color: Color(0xFF7A7A7A),
                            fontSize: 14,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w400,
                            height: 1.54,
                            ),
                            ),
                            TextSpan(
                            text: price,
                            style: const TextStyle(
                            color: Color(0xFF563E1F),
                            fontSize: 14,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w600,
                            height: 1.54,
                            ),
                            ),
              ]
                            ),
            ),),
            const Icon(Icons.arrow_forward),
                            ],
      ),
    );

  }
}