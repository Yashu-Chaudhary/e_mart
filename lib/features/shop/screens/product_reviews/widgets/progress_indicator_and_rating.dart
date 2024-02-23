import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class PRatingProgressIndicator extends StatelessWidget {
  const PRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: PDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: PColors.grey,
              valueColor: const AlwaysStoppedAnimation(PColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}
