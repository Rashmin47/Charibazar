import 'package:charibazarapp/common/widgets/texts/section_heading.dart';
import 'package:charibazarapp/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:charibazarapp/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:charibazarapp/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:charibazarapp/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:charibazarapp/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:charibazarapp/features/shop/screens/product_reviews/product_%20reviews.dart';
import 'package:charibazarapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return   Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
          /// Product Image Slider
           const ProductImageSlider(),
          /// Product Details
            Padding(padding:  const EdgeInsets.only(
              right: TSizes.defaultSpace,
              left: TSizes.defaultSpace,
              bottom: TSizes.defaultSpace
            ),
            child: Column(
              children: [
                /// Rating & Share
                 const RatingAndShare(),
                /// Price, Title, Stock & Brand
                const ProductMetaData(),
                /// Attributes
                const ProductAttributes(),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Checkout Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {} , child: const Text('Check Out'))),
                const SizedBox(height: TSizes.spaceBtwSections),
                /// Description
                const SectionHeading(title: 'Description',showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText('This is a Product description for Clash Of Clans Gold Pass. There are more  things that can be added but am uncertain what to add.',
                trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Show Less',
                  moreStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),


                /// Reviews
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3)),
                    ],
                     ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}




