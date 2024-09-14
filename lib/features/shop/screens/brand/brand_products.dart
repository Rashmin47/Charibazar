import 'package:charibazarapp/common/widgets/appbar/appbar.dart';
import 'package:charibazarapp/common/widgets/brands/brand_card.dart';
import 'package:charibazarapp/common/widgets/products/sortable/sortable_products.dart';
import 'package:charibazarapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Garena'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand detail
            BrandCard(showBorder: true),
             SizedBox(height: TSizes.spaceBtwSections),

            SortableProducts()
          ],
        ),
        ),
      ),
    );
  }
}
