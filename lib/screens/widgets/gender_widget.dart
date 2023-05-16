import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget(
      {super.key,
      double this.width = 0,
      double this.height = 0,
      Color this.color = Colors.grey,
      this.text,
      this.icon,
      this.onTap});

  final double? width;
  final double? height;
  final Color? color;
  final String? text;
  final IconData? icon;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.person,
              size: 64,
            ),
            const SizedBox(height: 8),
            Text(
              text ?? '',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
