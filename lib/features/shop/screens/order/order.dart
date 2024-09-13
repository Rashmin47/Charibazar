import 'package:charibazarapp/common/widgets/appbar/appbar.dart';
import 'package:charibazarapp/features/shop/screens/order/widgets/order_list.dart';
import 'package:charibazarapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar: TAppBar(
        showBackArrow: true,
        title : Text('My Orders', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),

        /// Orders
        child: OrderListItems(),
      ),

    );
  }
}
