import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_flutter/config/routes/routes_name.dart';
import 'package:pos_flutter/core/components/custom_image_view.dart';
import 'package:pos_flutter/core/utils/strings/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    _loading();
  }

  _loading() {
    Timer(const Duration(seconds: 3), () {
          // const MainScreen();
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.mainScreen, (route) => false);
    });
  }

   @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomImageView(
        height: double.infinity,
        width: double.infinity,
        imagePath: Assets.imagesSplash,
      ),
    );
  }
}