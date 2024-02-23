import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import '../views/home/home.page.dart';
import 'config/config.dart';
import 'models/session.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'constants/constants.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Session(),
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: EasyDynamicTheme.of(context).themeMode,
        navigatorKey: AppConfig.navigatorKey,
        home: const HomePage(),
      ),
    );
  }
}
