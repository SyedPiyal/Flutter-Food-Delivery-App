import 'package:flutter/material.dart';
import 'package:food_app/core/service/service_locator.dart';
import 'package:food_app/utils/entry_point.dart';
import 'package:food_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/provider/login_provider.dart';
import 'core/provider/food_provider.dart';
import 'core/view/onboarding/onboarding_scrreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependencySetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: AppTheme.theme,
        home: FutureBuilder<Widget>(
          future: _getInitialScreen(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return snapshot.data!;
          },
        ),
      ),
    );
  }
  Future<Widget> _getInitialScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      return const EntryPoint();
    } else {
      return const OnboardingScreen();
    }
  }
}
