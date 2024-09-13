

import 'package:charibazarapp/features/personalization/screens/address/widgets/single_address.dart';
import 'package:charibazarapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:charibazarapp/common/widgets/appbar/appbar.dart';
import 'package:charibazarapp/features/personalization/screens/address/add_new_address.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
    backgroundColor: TColors.primary,
      child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title : Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body:  const SingleChildScrollView(
        child: Padding(padding:  EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SingleAddress(selectedAddress: true),
            SingleAddress(selectedAddress: false),

          ],
        ),
        ),
      ),
    );
  }
}
