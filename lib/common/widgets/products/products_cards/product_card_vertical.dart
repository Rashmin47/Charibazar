import 'package:charibazarapp/common/widgets/images/rounded_image.dart';
import 'package:charibazarapp/features/shop/screens/product_details/product_detail.dart';
import 'package:charibazarapp/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:charibazarapp/common/widgets/texts/product_title_text.dart';
import 'package:charibazarapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../texts/product_price_text.dart';
class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);
    /// Container with side paddings, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
        children: [
          /// Thumbnail, Wishlist Button, Discount Tag
          RoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                const RoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true),

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
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Details
            const Padding(
            padding:  EdgeInsets.only(left: TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTitleText(title: 'FreeFire UID Topup', smallSize: true),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                BrandTitleTextWithVerifiedIcon(title: 'Freefire'),



              ],
            ),
          ),
          /// Spacer() to keep same height
          const Spacer(),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Price
              const Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child:  ProductPriceText(price: '99'),
              ),
              /// Add to Cart Button
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
                    child: Center(child: Icon(Iconsax.add, color: TColors.white))),
              )
            ],
          )

        ],),
      ),
    );
  }
}






