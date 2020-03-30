import 'package:OilPos/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:OilPos/src/util/theme_notifier.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'ပင်မစာမျက်နှာ',
      theme: themeNotifier.getTheme(),
      home: LoginScreen(),
    );
  }
}
