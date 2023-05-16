import 'package:bmi_calculator/screens/widgets/gender_widget.dart';
import 'package:bmi_calculator/screens/widgets/height_slider.dart';
import 'package:bmi_calculator/screens/widgets/selector_container.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'bmi_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.isSwitched = false});

  final bool isSwitched;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = -1;
  double widthNotSelected = 150;
  double widthSelected = 155;
  double heightNotSelected = 150;
  double heightSelected = 155;

  double height = 100;
  double weight = 0;
  double age = 0;
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmi = 0;

  @override
  void initState() {
    heightController.text = height.toStringAsFixed(0);
    weightController.text = weight.toStringAsFixed(0);
    ageController.text = age.toStringAsFixed(0);
    super.initState();
  }

  void calculateBMI(double height, double weight) {
    double heightInMeters = height / 100;
    bmi = weight / (heightInMeters * heightInMeters);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderWidget(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    width: index == 0 ? widthSelected : widthNotSelected,
                    height: index == 0 ? heightSelected : heightNotSelected,
                    text: "MALE",
                    icon: Icons.male,
                    color: index == 0
                        ? widget.isSwitched
                            ? AppColors.colorSelectedDark
                            : AppColors.colorSelectedLight
                        : widget.isSwitched
                            ? AppColors.colorNotSelectedDark
                            : AppColors.colorNotSelectedLight,
                  ),
                  GenderWidget(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    width: index == 1 ? widthSelected : widthNotSelected,
                    height: index == 1 ? heightSelected : heightNotSelected,
                    text: "FEMALE",
                    icon: Icons.female,
                    color: index == 1
                        ? widget.isSwitched
                            ? AppColors.colorSelectedDark
                            : AppColors.colorSelectedLight
                        : widget.isSwitched
                            ? AppColors.colorNotSelectedDark
                            : AppColors.colorNotSelectedLight,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              HeightSlider(
                minimum: 0,
                maximum: 300,
                color: widget.isSwitched
                    ? AppColors.colorNotSelectedDark
                    : AppColors.colorNotSelectedLight,
                controller: heightController,
                onChangedSlider: (value) {
                  setState(() {
                    height = value;
                    heightController.text = height.toStringAsFixed(0);
                  });
                },
                onChangedText: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      height = double.parse(heightController.text);
                    });
                  }
                },
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectorContainer(
                    width: 150,
                    height: 180,
                    maxValue: 300,
                    textController: weightController,
                    text: "WEIGHT (KG)",
                    number: weight,
                    color: widget.isSwitched
                        ? AppColors.colorNotSelectedDark
                        : AppColors.colorNotSelectedLight,
                    onAdd: () {
                      setState(() {
                        if (weight < 300) {
                          weight = double.parse(weightController.text);
                          weight++;
                          weightController.text = weight.toStringAsFixed(1);
                        }
                      });
                    },
                    onRemove: () {
                      setState(() {
                        if (weight > 0) {
                          weight = double.parse(weightController.text);
                          weight--;
                          weightController.text = weight.toStringAsFixed(1);
                        }
                      });
                    },
                  ),
                  SelectorContainer(
                    width: 150,
                    height: 180,
                    maxValue: 100,
                    textController: ageController,
                    text: "AGE",
                    number: age,
                    color: widget.isSwitched
                        ? AppColors.colorNotSelectedDark
                        : AppColors.colorNotSelectedLight,
                    onAdd: () {
                      setState(() {
                        if (age < 100) {
                          age = double.parse(ageController.text);
                          age++;
                          ageController.text = age.toStringAsFixed(0);
                        }
                      });
                    },
                    onRemove: () {
                      setState(() {
                        if (age > 0) {
                          age = double.parse(ageController.text);
                          age--;
                          ageController.text = age.toStringAsFixed(0);
                        }
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: widget.isSwitched
                      ? AppColors.colorSelectedDark
                      : AppColors.colorSelectedLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextButton(
                  onPressed: () {
                    height = double.parse(heightController.text);
                    weight = double.parse(weightController.text);
                    age = double.parse(ageController.text);
                    if (height > 0 && weight > 0 && age > 0 && index != -1) {
                      calculateBMI(height, weight);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BMIPage(
                            bmi: bmi,
                            isSwitched: widget.isSwitched,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill in all the fields"),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "CALCULATE",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
