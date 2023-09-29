import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/provider/user_registration_provider.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/presentation/provider/common_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/cosmic_food/authentication/presentation/pages/welcome_page.dart';
import 'package:cosmic_food_app/service_locator.dart' as sl;
import 'package:cosmic_food_app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => serviceLocator<CommonProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => serviceLocator<UserRegProvider>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
      ),
    );
  }
}
