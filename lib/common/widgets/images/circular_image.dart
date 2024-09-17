import 'package:cached_network_image/cached_network_image.dart';
import 'package:charibazarapp/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit,
    required this.image,
    this.isNetworkImage =true,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
  });


  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
        color: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage ? CachedNetworkImage(imageUrl: image,
          fit: fit,
            color: overlayColor,
            progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 55, height: 55, radius: 55),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
          : Image(
            fit: fit,
            image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}