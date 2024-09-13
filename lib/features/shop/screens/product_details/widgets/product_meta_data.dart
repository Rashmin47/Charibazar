import 'package:charibazarapp/common/widgets/images/circular_image.dart';
import 'package:charibazarapp/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:charibazarapp/common/widgets/texts/product_price_text.dart';
import 'package:charibazarapp/common/widgets/texts/product_title_text.dart';
import 'package:charibazarapp/utils/constants/enums.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            
            /// Price
            Text('Rs250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            const ProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        /// Title
        const ProductTitleText(title: 'Clash of Clans Gold Pass'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        /// Stock Status
        Row(
          children: [
             const ProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
    ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(image: TImages.supercell,
              width: 32,
            height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black
            ),
            const BrandTitleTextWithVerifiedIcon(title: 'Supercell', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
