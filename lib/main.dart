import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kafil/routes.dart';
import 'package:kafil/screens/login_screen.dart';
import 'package:kafil/services/services.dart';

import 'bindings/initial_bindings.dart';
import 'themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          unselectedWidgetColor: Colors.grey[350],
          scaffoldBackgroundColor: Colors.white,
          checkboxTheme: CheckboxThemeData(
              side: BorderSide(
                color: Colors.grey[350]!,
              )),
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: primaryColor,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 50.0,
          ),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            )
        )
      ),
      initialBinding: InitialBindings(),
      getPages: getRoutes,
    );
  }
}


