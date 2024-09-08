import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [

          /// Email
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// password
          TextFormField(decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: TTexts.password,
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),

          /// Remember me & forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// remember me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(TTexts.rememberMe),
                ],
              ),

              /// Forget Password
              TextButton(onPressed: () {},
                  child: const Text(TTexts.forgetPassword)),

            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          /// Sign In Button
          SizedBox(width: double.infinity, child : ElevatedButton(onPressed: (){}, child: const Text(TTexts.signIn))),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Create Account Section
          SizedBox(width: double.infinity, child : OutlinedButton(onPressed: (){}, child: const Text(TTexts.createAccount))),


        ],
      ),
    ),
    );
  }
}