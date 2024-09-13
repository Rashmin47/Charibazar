import 'package:charibazarapp/common/widgets/appbar/appbar.dart';
import 'package:charibazarapp/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:charibazarapp/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:charibazarapp/common/widgets/texts/section_heading.dart';
import 'package:charibazarapp/features/personalization/screens/address/address.dart';
import 'package:charibazarapp/features/personalization/screens/profile/profile.dart';
import 'package:charibazarapp/features/shop/screens/order/order.dart';
import 'package:charibazarapp/utils/constants/colors.dart';
import 'package:charibazarapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Header
            PrimaryHeaderContainer(
                child: Column(
                  children: [
                    TAppBar(
                        title: Text('Account',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(color: TColors.white))),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// User Profile Card
                    UserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                )),

            /// Body
             Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [

                  /// Account Setting
                  const SectionHeading(title: 'Account Setting', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  SettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set Delivery Address', onTap: () => Get.to(() =>  const UserAddressScreen()),
                  ),
                  SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, Remove Products and Move to Checkout', onTap: () {}),
                  SettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-Progress and Completed Orders', onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  SettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to Registered Bank Account', onTap: () {}),
                  SettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all Discounted Coupons', onTap: () {}),
                  SettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of Notification Messages', onTap: () {}),
                  SettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and Connected Accounts', onTap: () {}),

                  /// App settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const SectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to Your Cloud Firebase', onTap: () {}),

                  SettingsMenuTile(icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set Recommendation based on Location',
                      trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(icon: Iconsax.security_user,
    title: 'Safe Mode',
    subTitle: 'Search result is safe for all ages',
    trailing: Switch(value: false, onChanged: (value) {}),
    ),
                 SettingsMenuTile(icon: Iconsax.image,
    title: 'HD Image Quality',
    subTitle: 'Set Image Quality to be Seen',
    trailing: Switch(value: false, onChanged: (value) {}),
    ),

                  /// Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
  ],
              ),)
          ],
        ),
      ),
    );
  }
}


