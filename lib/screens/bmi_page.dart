import 'package:bmi_calculator/theme/colors.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({
    super.key,
    required this.bmi,
    this.isSwitched = false,
  });
  final double bmi;
  final bool isSwitched;

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  String type = "";
  String advice = "";
  Color wordColor = Colors.grey;

  @override
  void initState() {
    if (widget.bmi < 18.5) {
      type = "UNDERWEIGHT";
      advice = "You can eat a bit more";
      wordColor = Colors.yellow;
    } else if (widget.bmi >= 18.5 && widget.bmi <= 24.9) {
      type = "NORMAL";
      advice = "Good job!";
      wordColor = Colors.green;
    } else if (widget.bmi >= 25 && widget.bmi <= 29.9) {
      type = "OVERWEIGHT";
      advice = "You can exercise a bit more";
      wordColor = Colors.yellow;
    } else if (widget.bmi >= 30) {
      type = "OBESE";
      advice = "You can exercise a lot more";
      wordColor = Colors.red;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 16),
              const Text(
                "YOUR RESULT",
                style: TextStyle(
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: widget.isSwitched
                        ? AppColors.colorNotSelectedDark
                        : AppColors.colorNotSelectedLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            type,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: wordColor,
                            ),
                          ),
                          Text(
                            widget.bmi.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: const [
                          Text(
                            "Normal BMI range:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "18,5 - 25 kg/m2",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          "You have $type body weight. $advice",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  "RE-CALCULATE YOUR BMI",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
