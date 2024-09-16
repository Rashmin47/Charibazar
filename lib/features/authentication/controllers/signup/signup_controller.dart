import 'package:charibazarapp/data/repositories/authentication/authentication_repository.dart';
import 'package:charibazarapp/data/repositories/user/user_repository.dart';
import 'package:charibazarapp/features/authentication/screens.onboarding/widgets/verify_email.dart';
import 'package:charibazarapp/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

   /// Variables
  final hidePassword = true.obs; // Controller for email input
  final privacyPolicy = true.obs; // Controller for email input
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final firstName = TextEditingController(); // Controller for first name input
  final password = TextEditingController(); // Controller for password input
  final username = TextEditingController(); // Controller for username input
  final phoneNumber = TextEditingController(); // Controller for phoneNumber input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

    /// SignUp
    void signup() async {
  try {
    // Start Loading
    FullScreenLoader.openLoadingDialog('We are processing your information...', TImages.docerAnimation);

    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      // Remove Loader
      FullScreenLoader.stopLoading();
      return;
    }



    // Form Validation
    if(!signupFormKey.currentState!.validate()) {
      // Remove Loader
      FullScreenLoader.stopLoading();
      return;
    }

    // Privacy Policy Check
    if (!privacyPolicy.value) {
      Loaders.warningSnackBar(
          title: 'Accept Privacy Policy',
      message: 'In Order to Create Account, You must have to read and accept the Privacy Policy & Terms of Use. '
      );
      return;
    }

    // Register user in the Firebase Authentication & Save user data in the Firebase
    final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

    // Save Authenticated user data in the Firebase Firestore
    final newUser = UserModel(
      id: userCredential.user!.uid,
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      username: username.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      profilePicture: ''
    );

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);

    // Remove Loader
    FullScreenLoader.stopLoading();

    // Show Success Message
    Loaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue');

    // Move to Verify Email Screen
    Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));
  } catch(e) {
    // Remove Loader
    FullScreenLoader.stopLoading();

    // Show Some Generic Error to the user
    Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
  }
  }
    }
