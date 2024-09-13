import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons =true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections), itemCount: 2,
        itemBuilder: (_, index) =>  Column(
          children: [
            /// Cart Item
            const CartItem(),
            if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
            /// Add Remove Button with total price

            if (showAddRemoveButtons) const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra Space
                    SizedBox(width: 70),


                    /// Add Remove Buttons
                    ProductQuantityWithAddRemove(),
                  ],
                ),


                ProductTitleText(title: '250'),

              ],
            )


          ],
        ) );
  }
}
