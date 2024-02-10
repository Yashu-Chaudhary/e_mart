import 'package:e_mart/common/styles/spacing_styles.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // ...................Image................
              Image(
                image: AssetImage(image),
                width: PHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              // ...............Title & SubTitle..........
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),

              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              //.................Button.....................
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(PText.pContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
