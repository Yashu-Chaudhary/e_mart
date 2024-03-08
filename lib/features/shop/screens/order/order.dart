import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/features/shop/screens/order/widgets/orders_lsit.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar---------
      appBar: PAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(padding: EdgeInsets.all(PSizes.defaultSpace),
      
      /// ---Orders-----
      child: POrderListItems(),
      ),
    );
  }
}
