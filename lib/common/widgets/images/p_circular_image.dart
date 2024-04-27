import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_mart/common/widgets/shimmers/shimmer.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PCircularImage extends StatelessWidget {
  const PCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = PSizes.sm,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    bool dark = PHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // if image background color is nulll then switch it to laight and dark mode color design.
        color: backgroundColor ??(dark ? PColors.black : PColors.white) ,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fill,
                color: overlayColor,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const PShimmerEffect(width: 55, height: 55, radius: 55,),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(
                fit: BoxFit.fill,
                image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
                color: overlayColor,
              ),
      ),
    );
  }
}
