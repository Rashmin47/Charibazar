import 'package:charibazarapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';


/// A Widget for displaying an animated loading indicator with optional text and action button.
class AnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the AnimationLoaderWidget
  ///
  /// Parameters:
  /// -text: The text to be displayed in the loading dialog.
  /// -animation: The path to the Lottie animation to be shown.
  /// -showAction: The path to the Lottie animation to be shown.
  /// -actionText: The path to the Lottie animation to be shown.
  /// -onActionPressed: The path to the Lottie animation to be shown.
  const AnimationLoaderWidget({super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8), // Display Lottie animation
          const SizedBox(height: TSizes.defaultSpace),
          Text(
            text,
              style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          showAction ? SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
              child: Text(
                actionText!,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),
              ),
          ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}

