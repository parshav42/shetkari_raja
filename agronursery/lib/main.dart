import 'package:flutter/material.dart';
import 'package:agronursery/screens/role_selection_screen.dart';
import 'package:agronursery/screens/farmer_home_screen.dart';
import 'package:agronursery/screens/nursery_dashboard_screen.dart';
import 'package:agronursery/theme/app_theme.dart';
import 'package:agronursery/screens/splash_screen.dart';
import 'package:agronursery/screens/category_selection_screen.dart';
import 'package:agronursery/screens/nearby_nurseries_screen.dart';
import 'package:agronursery/screens/purchase_screen.dart';
import 'package:agronursery/screens/nursery_otp_login_screen.dart';
import 'package:agronursery/screens/farmer_login_screen.dart';
import 'package:agronursery/screens/add_stock_screen.dart';
import 'package:agronursery/screens/my_stock_screen.dart';
import 'package:agronursery/screens/leads_screen.dart';
import 'package:agronursery/screens/profile_screen.dart';
import 'package:agronursery/screens/regiatration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroNursery',
      theme: AppTheme.theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/': (context) => const RoleSelectionScreen(),
        '/splash': (context) => const SplashScreen(),
        '/farmer': (context) => const FarmerHomeScreen(),
        '/farmer-login': (context) => const FarmerLoginScreen(),
        '/nursery': (context) => const NurseryOwnerScreen(),
        '/categories': (context) => const CategorySelectionScreen(),
        '/nearby': (context) => const NearbyNurseriesScreen(),
        '/purchase': (context) => const PurchaseScreen(),
        '/nursery-login': (context) => const NurseryOtpLoginScreen(),
        '/nursery-register': (context) => const NurseryRegisterPage(),
        '/add-stock': (context) => const AddStockScreen(),
        '/my-stock': (context) => const MyStockScreen(),
        '/leads': (context) => const LeadsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
