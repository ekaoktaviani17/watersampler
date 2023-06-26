import 'package:bismillah_ta/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/homepage_binding.dart';
import 'views/homepage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: AppRoute.pages,
      initialBinding: HomepageBinding(),
      home: const Homepage(),
    );
  }
}
