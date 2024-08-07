



import 'package:get/get_navigation/src/routes/get_route.dart';

import 'screens/complete_data.dart';
import 'screens/layout_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/success_register.dart';

List<GetPage<dynamic>>? getRoutes = [
  GetPage(name: '/',                  page: () => const LoginScreen(),),
  GetPage(name: '/signup',            page: () => const RegisterScreen(),),
  GetPage(name: '/completedata',      page: () => const CompleteData(),),
  GetPage(name: '/homelayout',        page: () => const HomeLayout(),),
  GetPage(name: '/success',           page: () => const SuccessSignup(),),
];