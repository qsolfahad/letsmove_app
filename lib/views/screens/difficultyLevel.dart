import 'package:flutter/material.dart';
import 'package:letsmove_app/views/screens/component/header.dart';

import '../../model/data/constant.dart';

class DifficultyLevel {
  final String title;
  final String description;

  DifficultyLevel(this.title, this.description);
}

class DifficultyLevelsStepIndicator extends StatefulWidget {
  final title;
  const DifficultyLevelsStepIndicator({super.key, this.title});

  @override
  _DifficultyLevelsStepIndicatorState createState() =>
      _DifficultyLevelsStepIndicatorState();
}
List<bool> _selected = List.generate(4, (index) => false);
class _DifficultyLevelsStepIndicatorState
    extends State<DifficultyLevelsStepIndicator> {
  // Change this to set the current step index
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(widget.title),
        for (var index = 0; index < difficultyLevels.length; index++)
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                child: Card(
                  elevation: 4,
                  color: _selected[index] ? Colors.blue : Colors.white,
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          difficultyLevels[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            color: _selected[index] ? Colors.white : Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          difficultyLevels[index].description,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selected = List.generate(4, (index) => false);
                    _selected[index] = !_selected[index];
                  });
                },
              )),
      ],
    );
  }
}
