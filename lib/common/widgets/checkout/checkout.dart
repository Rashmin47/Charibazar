import 'package:charibazarapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:charibazarapp/common/widgets/success_screen/success_screen.dart';
import 'package:charibazarapp/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:charibazarapp/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:charibazarapp/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:charibazarapp/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:charibazarapp/navigation_menu.dart';
import 'package:charibazarapp/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../appbar/appbar.dart';
import '../products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body:   SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Items in Cart
             const CartItems(showAddRemoveButtons: false),
             const SizedBox(height: TSizes.spaceBtwSections),

            /// Coupon Textfield
            const CouponCode(),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Billing Section
            RoundedContainer(
              showBorder: true,
              backgroundColor: dark ? TColors.black : TColors.white,
              child: const Padding(padding: EdgeInsets.all(TSizes.md),
              child: const Column(
                children: [
                  /// Pricing
                  BillingAmountSection(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  /// Divider
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  /// Payment Methods
                  BillingPaymentSection(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  /// Address
                  BillingAddressSection()
                ],
              ),
            )
            ),
          ],
        ),
        ),

      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() =>  SuccessScreen(image: TImages.successfulPaymentIcon,
            title: 'Payment Successful !',
            subTitle: 'Your Item will be delivered shortly!',
            onPressed: () => Get.to(() => const NavigationMenu())
        ),
        ), child: const Text('Checkout \Rs 250')),
      ),
    );
  }
}


