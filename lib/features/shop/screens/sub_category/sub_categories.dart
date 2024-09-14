import 'package:charibazarapp/common/widgets/appbar/appbar.dart';
import 'package:charibazarapp/common/widgets/images/rounded_image.dart';
import 'package:charibazarapp/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:charibazarapp/common/widgets/texts/section_heading.dart';
import 'package:charibazarapp/utils/constants/image_strings.dart';
import 'package:charibazarapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  const TAppBar(
        title: Text('Top up'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner
             const RoundedImage(width: double.infinity, imageUrl: TImages.promoBanner3, applyImageRadius: true),
             const SizedBox(height: TSizes.spaceBtwSections),

            /// Syb Categories
            Column(
              children: [
                /// Heading
                SectionHeading(title: 'In-Game Currencies', onPressed: () {}),
                const SizedBox(height: TSizes.spaceBtwItems / 2),


                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const ProductCardHorizontal()),
                ),
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
