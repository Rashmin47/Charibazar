import 'package:charibazarapp/common/widgets/appbar/appbar.dart';
import 'package:charibazarapp/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:charibazarapp/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      /// AppBar
      appBar: const TAppBar(
        title: Text('Review & Ratings'),showBackArrow: true
      ),

      /// Body
      body: SingleChildScrollView(
        padding:  const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Overall Product Ratings
            const OverallProductRating(),
            const TRatingBarIndicator(rating: 3.5),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// User Reviews List
           const UserReviewCard(),
           const UserReviewCard(),
           const UserReviewCard(),
           const UserReviewCard(),


          ],
        ),

      ),
    );
  }
}






