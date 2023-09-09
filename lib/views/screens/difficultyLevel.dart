import 'package:flutter/material.dart';

class DifficultyLevel {
  final String title;
  final String description;

  DifficultyLevel(this.title, this.description);
}

final List<DifficultyLevel> difficultyLevels = [
  DifficultyLevel('Easy', 'Suitable for beginners'),
  DifficultyLevel('Intermediate', 'Some experience required'),
  DifficultyLevel('Advanced', 'Challenging for experts'),
  DifficultyLevel('Expert', 'Only for the very experienced'),
];

class DifficultyLevelsStepIndicator extends StatefulWidget {
  @override
  _DifficultyLevelsStepIndicatorState createState() =>
      _DifficultyLevelsStepIndicatorState();
}

class _DifficultyLevelsStepIndicatorState
    extends State<DifficultyLevelsStepIndicator> {
  int currentStep = 2; // Change this to set the current step index

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < difficultyLevels.length; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentStep = i;
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentStep == i ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Selected Difficulty Level',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    difficultyLevels[currentStep].title,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    difficultyLevels[currentStep].description,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
