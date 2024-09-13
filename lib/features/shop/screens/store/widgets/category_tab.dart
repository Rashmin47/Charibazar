import 'package:charibazarapp/common/widgets/layouts/grid_layout.dart';
import 'package:charibazarapp/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/products/products_cards/product_card_vertical.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
        padding:  const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Brands
            const BrandShowcase(images: [TImages.productImage1, TImages.productImage2, TImages.productImage3,]),
            const BrandShowcase(images: [TImages.productImage4, TImages.productImage5, TImages.productImage6,]),
            const SizedBox(height: TSizes.spaceBtwItems),
            /// Products
            SectionHeading(title: 'You Might Like', onPressed: () {}),
            const SizedBox(height: TSizes.spaceBtwItems),

            GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
     const SizedBox(height: TSizes.spaceBtwSections),

          ],
        ),
      ),
    ],
    );
  }
}
