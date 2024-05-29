import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thyme_to_park_display/service/display/display_controller.dart';
import 'package:thyme_to_park_display/service/display/web_socket_display_controller.dart';
import 'package:thyme_to_park_display/service/registry/model/car.dart';
import 'package:thyme_to_park_display/ui/display.dart';
import 'package:thyme_to_park_display/ui/stateful_display.dart';
import 'package:thyme_to_park_display/ui/theme/color_schemes.dart';
import 'package:thyme_to_park_display/ui/theme/text_theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    // Must add this line.
    await windowManager.ensureInitialized();

    const windowOptions = WindowOptions(
      minimumSize: Size(800, 400),
      center: true,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final DisplayController _displayController = WebSocketDisplayController();

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: textTheme,
      ),
      home: StatefulDisplay(displayController: _displayController),
    );
  }
}
