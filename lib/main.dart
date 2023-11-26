import 'package:abyad/screens/abyad_nav_screen.dart';
import 'package:abyad/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Ro9yaApp());
}

class Ro9yaApp extends StatelessWidget {
  const Ro9yaApp({super.key});

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
