import 'package:e_mart/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class PHomeCategories extends StatelessWidget {
  const PHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return PVericalimageText(
              image: PImages.shoeIcon,
              title: 'Shoes',
              onTap: () {},
            );
          }),
    );
  }
}

