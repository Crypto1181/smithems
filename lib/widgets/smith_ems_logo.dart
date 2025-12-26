import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SmithEmsLogo extends StatelessWidget {
  final double size;
  
  const SmithEmsLogo({
    super.key,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryRed,
          width: 3,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          'logo/photo_2025-12-26_09-41-26.jpg',
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

