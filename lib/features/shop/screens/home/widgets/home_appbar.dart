import 'package:charibazarapp/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products.cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimmer loader while user profile is being loaded
              return const TShimmerEffect(width: 80, height: 15);
            } else{
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white));
            }
          }),
        ],
      ),
      actions: [
        CartCountericon(
          onPressed: () {},
          iconColor: TColors.white,
        )
      ],
    );
  }
}