import 'package:deepface_test/config/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPagePageState();
}

class _SplashPagePageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1000), () {
      context.go('/main');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash page', style: AppTextStyles.head20w5,),
      ),
    );
  }
}
