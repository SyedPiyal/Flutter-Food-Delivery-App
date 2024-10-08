import 'package:flutter/material.dart';

import '../../../../common/cards/iteam_card.dart';
import '../../../../utils/constants.dart';

class Items extends StatelessWidget {
  const Items({super.key, required this.demoData}); // Add required parameter demoData

  final List<Map<String, dynamic>> demoData; // Add demoData as a required parameter

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        ...List.generate(
          demoData.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            child: ItemCard(
              title: demoData[index]["name"] ?? "No Title",
              description: demoData[index]["location"] ?? "No Location",
              image: demoData[index]["image"] ?? "No Image",
              foodType: demoData[index]["foodType"] ?? "Fried",
              price: 0, 
              priceRange: "\$ \$", 
              press: () {}, 
            ),
          ),
        ),
      ],
    );
  }
}
