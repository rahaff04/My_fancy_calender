import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PixelButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const PixelButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: MyTheme.pastelPink,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: MyTheme.pixelOutline,
            width: 2,
          ),
        ),
        child: Icon(
          icon,
          size: 20,
          color: MyTheme.pixelOutline,
        ),
      ),
    );
  }
}