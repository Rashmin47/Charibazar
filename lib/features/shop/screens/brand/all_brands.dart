import 'package:charibazarapp/common/widgets/brands/brand_card.dart';
import 'package:charibazarapp/common/widgets/layouts/grid_layout.dart';
import 'package:charibazarapp/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:   const TAppBar(
        title: Text('Brand'),showBackArrow: true),
    body: SingleChildScrollView(
    child: Padding(padding:  const EdgeInsets.all(TSizes.defaultSpace),
    child: Column(
    children: [
    /// Heading
    const SectionHeading(title: 'Brands', showActionButton: false),
    const SizedBox(height: TSizes.spaceBtwItems ),

    /// Brands
      GridLayout(itemCount: 10,
          mainAxisExtent: 80,
          itemBuilder: (context, index) =>  BrandCard(showBorder: true, onTap: () => Get.to(() => const BrandProducts()),
          )),
    ],
    ),
    ),
    ),
    );
  }
}
