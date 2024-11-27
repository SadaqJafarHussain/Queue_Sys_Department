import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_system/screens/main_screen.dart';

import '../Controller/app_provider.dart';
import 'login_screen.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      await  Provider.of<AppProvider>(context,listen: false).getUser();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        if (provider.userModel == null) {
          // No user logged in, go to login screen
          return const Directionality(
              textDirection: TextDirection.rtl,
              child:  LoginScreen());
        } else {
          // User logged in, go to home screen
          return const Directionality(
              textDirection: TextDirection.ltr,
              child: MainScreen());
        }
      },
    );
  }
}
