import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'service_locator.dart' as sl;
import 'features/cosmic_food/authentication/presentation/pages/welcome_page.dart';
import 'features/cosmic_food/home/presentation/pages/home_pages.dart';
import 'features/cosmic_food/authentication/presentation/provider/user_registration_provider.dart';
import 'features/cosmic_food/common/presentation/provider/common_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(CosmicFoodApp());
}

class CosmicFoodApp extends StatelessWidget {
  const CosmicFoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl.serviceLocator<UsersProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl.serviceLocator<UserRegProvider>(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = context.watch<UsersProvider>();
    useEffect(() {
      usersProvider.getSignedUser(context);
    }, const []);

    return ScreenUtilInit(
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: usersProvider.users != null ? Homepage() : UserWelcomePage(),
      ),
    );
  }
}
