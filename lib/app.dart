import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_dbgetx/Controller/theme_comtroller.dart';
import 'package:weatherapp_dbgetx/Pages/HomePage/homepage.dart';
import 'package:weatherapp_dbgetx/Pages/SearchPage/search_page.dart';

import 'Pages/FavPage/favpage.dart';
import 'Pages/IntroPage/intro.dart';
import 'Pages/LogInPage/login.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeController themeController = Get.put(ThemeController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LoginPage(),
      getPages: [
        GetPage(name: '/', page: () => IntroPage()),
        GetPage(name: '/logIn_page', page: () => LoginPage()),
        GetPage(name: '/home_page', page: () => HomePage()),
        GetPage(name: '/fav_Page', page: () => FavPage()),
        GetPage(name: '/search_Page', page: () => SearchPage()),
      ],
    );
  }
}
