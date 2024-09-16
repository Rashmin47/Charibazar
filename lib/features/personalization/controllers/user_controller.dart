import 'package:charibazarapp/data/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_model.dart';
import '../../../utils/popups/loaders.dart';



class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save User Record from any Registration provider
Future<void> saveUserRecord(UserCredential? userCredentials) async {
  try {
    if (userCredentials != null) {
      // Convert Name to first and Last Name
      final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
      final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

      // Map Data
      final user = UserModel(id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
      );
      // Save User Data
      await userRepository.saveUserRecord(user);
    }
} catch (e){
  Loaders.warningSnackBar(
      title: 'Data not Saved',
      message: 'Something went wrong while saving your information. You can re-save your data in your Profile.');
}
}
}
