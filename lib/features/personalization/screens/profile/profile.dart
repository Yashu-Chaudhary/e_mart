import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/images/p_circular_image.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      // ------------Body----------
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              // --------Profile Picture--------------
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const PCircularImage(
                      image: PImages.user,
                      width: 80,
                      height: 80,
                      isNetworkImage: false,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              // ----------------Details----------------------------
              const SizedBox(height: PSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: PSizes.spaceBtwItems),

              // -----------------Heading Profile Info---------------
              const PSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),

              PProfileMenu(
                title: 'Name',
                value: 'Yashu Chaudhary',
                onPressed: () {},
              ),
              PProfileMenu(
                title: 'Username',
                value: 'yashu_chaudhary',
                onPressed: () {},
              ),
              const SizedBox(height: PSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: PSizes.spaceBtwItems),

              // ------------Heading Personal Info------------
              const PSectionHeading(
                  title: 'Personal Informaton', showActionButton: false),
              const SizedBox(height: PSizes.spaceBtwItems),

              PProfileMenu(
                title: 'User ID',
                value: '777',
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              PProfileMenu(
                title: 'E-mail',
                value: 'yashusky232@gmail.com',
                onPressed: () {},
              ),
              PProfileMenu(
                title: 'Phone Number',
                value: '+91 7906277120',
                onPressed: () {},
              ),
              PProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              PProfileMenu(
                title: 'Date of Birth',
                value: '07 May, 2004',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: PSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
