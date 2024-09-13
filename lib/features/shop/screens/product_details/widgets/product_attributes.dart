import 'package:charibazarapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:charibazarapp/common/widgets/texts/product_price_text.dart';
import 'package:charibazarapp/common/widgets/texts/product_title_text.dart';
import 'package:charibazarapp/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart ';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        RoundedContainer(
          padding:  const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child:  Column(
            children: [
              /// Title, Price & Stock Status
              Row(
                children: [
                  const SectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(


                        children: [
                          const ProductTitleText(title: 'Price : ', smallSize: true),

                          /// Actual Price
                          Text('Rs250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          /// Sale Price
                          const ProductPriceText(price: '195')
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductTitleText(title: 'Stock : ', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const ProductTitleText(title: ' This is the Description of the Product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),

        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Colors',showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [

                TChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
                TChoiceChip(text: 'Blue', selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Yellow', selected: false,onSelected: (value){}),

              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Sizes', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value){}),
                TChoiceChip(text: 'EU 36', selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Eu 38', selected: false,onSelected: (value){}),

              ],
            ),
          ],
        ),

      ],
    );
  }
}


