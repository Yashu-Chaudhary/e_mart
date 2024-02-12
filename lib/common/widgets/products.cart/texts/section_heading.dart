import 'package:flutter/material.dart';

class PSectionHeading extends StatelessWidget {
  const PSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    this.buttonTitle = 'View all',
    this.onPressed,
    required this.title,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
