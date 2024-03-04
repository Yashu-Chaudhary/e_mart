import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/features/personalization/screens/address/add_new_address.dart';
import 'package:e_mart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Icons.add, color: PColors.white,),
      ),
      appBar: PAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
        
        
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(PSizes.defaultSpace),
        child: Column(
          children: [
            PSingleAddress(selectedAddress: false),
            PSingleAddress(selectedAddress: true)
          ]
        ),
        ),
      ),
    );
  }
}
