import 'package:charibazarapp/bindings/general_bindings.dart';
import 'package:charibazarapp/utils/constants/colors.dart';
import 'package:charibazarapp/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Use this class to setup themes, initial Bindings, any animations and much more using Material widget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      themeMode: ThemeMode.system,
      theme : TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screeen.
      home: const Scaffold(backgroundColor: TColors.primary,body: CircularProgressIndicator(color: Colors.white)),
    );
  }
}