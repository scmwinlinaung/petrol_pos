import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:OilPos/src/util/theme_notifier.dart';
import 'package:OilPos/src/values/theme.dart';
import 'package:OilPos/src/app.dart';

final appTitle = 'Home';
void main() => runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        builder: (_) => ThemeNotifier(lightTheme),
        child: new App(),
      ),
    );
