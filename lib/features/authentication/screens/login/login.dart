import 'package:e_mart/common/styles/spacing_styles.dart';
import 'package:e_mart/common/widgets/login_signup/form_divider.dart';
import 'package:e_mart/common/widgets/login_signup/social_buttons.dart';
import 'package:e_mart/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_mart/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(),
              // ........Logo, Title & Sub-Title.......
              PLoginHeader(),

              // ........Form......
              PLoginForm(),

              // ............Divider..................
              PFormDivider(dividerText: PText.onSignInWith),
              SizedBox(
                width: PSizes.spaceBtwItems,
              ),

              // ................Footer................
              PSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
