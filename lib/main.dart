import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:queue_system/Controller/app_provider.dart';
import 'package:queue_system/screens/login_screen.dart';
import 'package:window_manager/window_manager.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Initialize window manager
    await windowManager.ensureInitialized();

    // Get the primary display's screen size
    final screenSize = ui.window.physicalSize;

    // Set the window size to the screen size and disable resizing
    WindowOptions windowOptions = WindowOptions(
      size: const Size(1300,800),               //////// Set window size to full screen size
      minimumSize: const Size(1300,800),         /////// Prevent resizing
      maximumSize: screenSize,         // Prevent resizing
      center: true,
      // Center the window
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setResizable(false);  // Disable resizing
    });
  }

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AppProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
           useMaterial3: true,
      ),
      home:const Directionality(
          textDirection:TextDirection.rtl,
          child: LoginScreen()),
    );
  }
}

