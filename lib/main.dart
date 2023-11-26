import 'package:abyad/screens/abyad_nav_screen.dart';
import 'package:abyad/utils/providers.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setWindowSize(const Size(800, 1200));
  runApp(const AbyadApp());
}

class AbyadApp extends StatelessWidget {
  const AbyadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          home: const AbyadNavScreen(),
        );
      },
    );
  }
}
