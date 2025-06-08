import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../constans/app_color.dart';
import '../../../../constans/app_constants.dart';
import '../../../../shared_components/card_task.dart';

class TaskInProgress extends StatelessWidget {
  const TaskInProgress({
    required this.data,
    Key? key,
  }) : super(key: key);

  final RxList<CardTaskData> data;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius * 2),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
            child: CardTask(
              data: data[index],
              primary: _getSequenceColor(index),
              onPrimary: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Color _getSequenceColor(int index) {
    int val = index % 4;
    if (val == 3) {
      return AppColor.blue;
    } else if (val == 2) {
      return Colors.redAccent;
    } else if (val == 1) {
      return AppColor.blue;
    } else {
      return Colors.amber;
    }
  }
}
