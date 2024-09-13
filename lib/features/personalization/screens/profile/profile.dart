import 'package:charibazarapp/common/widgets/appbar/appbar.dart';
import 'package:charibazarapp/common/widgets/images/circular_image.dart';
import 'package:charibazarapp/common/widgets/texts/section_heading.dart';
import 'package:charibazarapp/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile')
      ),
      /// Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
          /// Profile Picture
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
               const CircularImage(image: TImages.user, width: 80, height: 80),
                TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
              ],
            ),
          ),
            /// Details
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const SectionHeading(title: 'Profile Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            ProfileMenu(onPressed: () {}, title: 'Name', value: 'Charibazar'),
            ProfileMenu(onPressed: () {}, title: 'Username', value: 'Charibazar'),

            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Personal Info
            const SectionHeading(title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            ProfileMenu(onPressed: () {}, title: 'USER ID', value: '45689', icon: Iconsax.copy),
            ProfileMenu(onPressed: () {}, title: 'E-mail', value: 'chari_bazar'),
            ProfileMenu(onPressed: () {}, title: 'Phone Number', value: '98767563535'),
            ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
            ProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '10 Oct 1990'),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                'Close Account', style: TextStyle(color: Colors.red)
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}


