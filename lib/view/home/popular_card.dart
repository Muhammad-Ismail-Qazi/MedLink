import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/space_values.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Image.network(
              "url",
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Text(
                  "Dr. Fidan Agayeva",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
                Spaces.y1,
                const Text(
                  "Terapevt",
                  style: TextStyle(
                    color: Colors.grey,
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
