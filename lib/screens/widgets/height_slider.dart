import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider(
      {super.key,
      this.color,
      this.controller,
      required this.minimum,
      required this.maximum,
      this.height,
      this.onChangedText,
      this.onChangedSlider});

  final Color? color;
  final TextEditingController? controller;
  final double? minimum;
  final double? maximum;
  final double? height;
  final void Function(String)? onChangedText;
  final void Function(double)? onChangedSlider;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          const Text(
            "HEIGHT (CM)",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: onChangedText,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          Slider(
            min: minimum ?? 0,
            max: maximum ?? 300,
            onChanged: onChangedSlider,
            value: controller != null
                ? controller!.text.isNotEmpty
                    ? double.parse(controller!.text)
                    : 0
                : height ?? 0,
          )
        ],
      ),
    );
  }
}
