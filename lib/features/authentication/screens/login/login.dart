import 'package:charibazarapp/common/styles/spacing_styles.dart';
import 'package:charibazarapp/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../screens.onboarding/widgets/SocialButtons.dart';
import 'widgets/login_form.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [

              /// Logo, title & subtitle ///
        const LoginHeader(),


              /// Form
              const LoginForm(),

              /// Divider
               FormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}









