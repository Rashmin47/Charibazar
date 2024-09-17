import 'package:charibazarapp/common/widgets/shimmers/shimmer.dart';
import 'package:charibazarapp/common/widgets/appbar/appbar.dart';
import 'package:charibazarapp/common/widgets/images/circular_image.dart';
import 'package:charibazarapp/common/widgets/texts/section_heading.dart';
import 'package:charibazarapp/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:charibazarapp/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
               Obx((){
                 final networkImage = controller.user.value.profilePicture;
                 final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                 return controller.imageUploading.value
                   ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                 : CircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
               }),
                TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
              ],
            ),
          ),
            /// Details
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Profile Info
            const SectionHeading(title: 'Profile Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            ProfileMenu( title: 'Name', value: controller.user.value.fullName,onPressed: () => Get.to(() => const ChangeName())),
            ProfileMenu( title: 'Username', value: controller.user.value.username ,onPressed: () {},),

            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Personal Info
            const SectionHeading(title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            ProfileMenu( title: 'USER ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {},),
            ProfileMenu( title: 'E-mail', value: controller.user.value.email, onPressed: () {},),
            ProfileMenu( title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {},),
            ProfileMenu( title: 'Gender', value: 'Male', onPressed: () {},),
            ProfileMenu( title: 'Date of Birth', value: '10 Oct 1990', onPressed: () {},),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
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


