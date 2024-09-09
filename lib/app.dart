import 'package:charibazarapp/features/authentication/screens/onboarding/onboarding.dart';
import 'package:charibazarapp/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/// use this class to setup themes, initial Bindings, any animations and much more using Material widget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      themeMode: ThemeMode.system,
      theme : TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}