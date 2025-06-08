import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../constans/app_constants.dart';

class TaskProgressData {
  final int totalTask;
  final int totalCompleted;

  const TaskProgressData({
    required this.totalTask,
    required this.totalCompleted,
  });
}

class TaskProgress extends StatelessWidget {
  const TaskProgress({
    required this.data,
    Key? key,
  }) : super(key: key);

  final TaskProgressData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildText(),
        Expanded(child: _buildProgress()),
      ],
    );
  }

  Widget _buildText() {
    return Text(
      //"Recettes des ${data.totalTask} derniers événements",
      "Evénements précédents",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: kFontColorPallets[2],
        fontSize: 13,
      ),
    );
  }

  Widget _buildProgress() {
    return LinearPercentIndicator(
      percent: data.totalCompleted / data.totalTask,
      progressColor: Colors.blueGrey,
      backgroundColor: Colors.blueGrey[200],
    );
  }
}
