import 'package:e_mart/features/authentication/controllers/login/login_controller.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PSocialButtons extends StatelessWidget {
  const PSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: PColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: PSizes.iconMd,
              height: PSizes.iconMd,
              image: AssetImage(PImages.google),
            ),
          ),
        ),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: PColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: PSizes.iconMd,
              height: PSizes.iconMd,
              image: AssetImage(PImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
