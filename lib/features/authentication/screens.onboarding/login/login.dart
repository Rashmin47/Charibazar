import 'package:charibazarapp/common/styles/spacing_styles.dart';
import 'package:charibazarapp/utils/constants/colors.dart';
import 'package:charibazarapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../widgets/SocialButtons.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [

              /// Logo, title & subtitle ///
              const LoginHeader(dark ),

              /// Form
              const LoginForm(),
              /// Divider
              FormDivider(dark: dark),
              const SizedBox(height: TSizes.spaceBtwSections),
              /// Footer
              const SocialButtons(),


            ],


          ),


        ),),
    );
  }
}



class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? TColors.darkGrey: TColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(TTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? TColors.darkGrey: TColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}




