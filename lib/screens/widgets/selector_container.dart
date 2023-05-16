import 'package:flutter/material.dart';

class SelectorContainer extends StatelessWidget {
  const SelectorContainer(
      {super.key,
      double this.width = 0,
      double this.height = 0,
      Color this.color = Colors.grey,
      this.number = 0,
      this.text,
      this.onAdd,
      this.onRemove,
      this.textController,
      this.maxValue = 100});

  final double? width;
  final double? height;
  final Color? color;
  final String? text;
  final double number;
  final Function? onAdd;
  final Function? onRemove;
  final TextEditingController? textController;
  final double maxValue;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
          const SizedBox(height: 16),
          Text(
            text ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: textController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: number.toStringAsFixed(1),
              hintStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (double.parse(value) > maxValue) {
                  textController!.text = maxValue.toStringAsFixed(1);
                }
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onRemove as void Function()?,
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: onAdd as void Function()?,
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
