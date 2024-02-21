import 'package:e_mart/common/widgets/images/p_circular_image.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PUserProfileTitle extends StatelessWidget {
  const PUserProfileTitle({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const PCircularImage(
        image: PImages.user,
        width: 50,
        height: 50,
      ),
      title: Text(
        'Yashu Chaudhary',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: PColors.white),
      ),
      subtitle: Text(
        'support@emart.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: PColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: PColors.white,
        ),
      ),
    );
  }
}
