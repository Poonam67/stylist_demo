import 'package:flutter/material.dart';
import 'package:tyreplex_demo/core/constants/image_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu icon with circular background
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.3),
            child: Icon(Icons.menu, color: Colors.black87),
          ),

          // Logo + Stylish Text
          Row(
            children: [
              Image.asset(
                ImageConstants.logoImage, 
                height: 40,
              ),
              SizedBox(width: 8),
            ],
          ),

          // Profile image
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.red.shade200,
            backgroundImage: AssetImage(
              ImageConstants.userActImage,
            ), 
          ),
        ],
      ),
    );
  }
}
