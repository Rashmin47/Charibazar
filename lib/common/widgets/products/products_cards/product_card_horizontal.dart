import 'package:charibazarapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:charibazarapp/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:charibazarapp/common/widgets/texts/product_price_text.dart';
import 'package:charibazarapp/common/widgets/texts/product_title_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';
class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        width: 310 ,
        padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(TSizes.productImageRadius),
    color: dark ? TColors.darkerGrey : TColors.softGrey,
    ),
      child:  Row(
        children: [
        /// Thumbnail
        RoundedContainer(
          height: 120,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.dark : TColors.light,
          child:  Stack(
              children: [
              /// Thumbnail Image
              const SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(imageUrl: TImages.productImage51, applyImageRadius: true)),

                /// Sale Tag
                Positioned(
                  top: 12,
                  child: RoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                ),
                /// Favorite icon Button

                const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(icon: Iconsax.heart5, color: Colors.red)),
          ],
        ),
      ),

          /// Details
           SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: 'Freefire Diamond UID Topup' ,smallSize: true),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      BrandTitleTextWithVerifiedIcon(title: 'Garena'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: ProductPriceText(price: '270.0')),


                      /// Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child:
                        const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: TColors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
      ),
      );

  }
}
