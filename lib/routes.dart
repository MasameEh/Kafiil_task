import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kafil/shared/middleware/mymiddleware.dart';

import 'screens/auth/complete_data.dart';
import 'screens/layout_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/success_register.dart';

List<GetPage<dynamic>>? getRoutes = [
  GetPage(name: '/',                  page: () => const LoginScreen(), middlewares: [
    MyMiddleWare(),
  ]),
  GetPage(name: '/signup',            page: () => const RegisterScreen(),),
  GetPage(name: '/completedata',      page: () => const CompleteData(),),
  GetPage(name: '/homelayout',        page: () => const HomeLayout(),),
  GetPage(name: '/success',           page: () => const SuccessSignup(),),
];