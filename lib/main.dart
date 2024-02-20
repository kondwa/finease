import 'package:finease/controllers/rate.dart';
import 'package:finease/screens/home.dart';
import 'package:finease/screens/loading.dart';
import 'package:finease/screens/offline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';

void main() {
  Get.lazyPut(() => RateController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'FinEase',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFe51b23)),
          useMaterial3: true,
        ),
        home: ConnectivityBuilder(builder: (status) {
          if (status == ConnectivityStatus.online) {
            return const HomeScreen();
          } else if (status == ConnectivityStatus.offline) {
            return const OfflineScreen();
          } else {
            return const LoadingScreen();
          }
        }));
  }
}
