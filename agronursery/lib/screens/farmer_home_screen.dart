import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'profile_screen.dart';
import 'purchase_screen.dart';

// Import widget pages
import '../widgets/sugercane_page.dart';
import '../widgets/tomato_page.dart';
import '../widgets/mango_page.dart';
import '../widgets/zendu_page.dart';
import '../widgets/show_page.dart';

class FarmerHomeScreen extends StatefulWidget {
  const FarmerHomeScreen({super.key});

  @override
  State<FarmerHomeScreen> createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final lightGreen = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;
    final lightBlue = Color.lerp(AppColors.blue, AppColors.green, 0.85)!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [lightGreen, lightBlue],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: _getCurrentPage(),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }

  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return const HomeGridPage();
      case 1:
        return PurchaseScreen(onBackToHome: () => _goToHome());
      case 2:
        return ProfileScreen(onBackToHome: () => _goToHome());
      default:
        return const HomeGridPage();
    }
  }

  void _goToHome() {
    setState(() {
      _currentIndex = 0;
    });
  }

  Widget _buildBottomNav() {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeGridPage extends StatelessWidget {
  const HomeGridPage({Key? key}) : super(key: key);

  final List<_Category> categories = const [
    _Category(label: 'Sugarcane', icon: Icons.grass, asset: 'assets/sugarcane.png'),
    _Category(label: 'Tomato', icon: Icons.local_florist, asset: 'assets/tomato.png'),
    _Category(label: 'Mango', icon: Icons.eco, asset: 'assets/mango.png'),
    _Category(label: 'Cotton', icon: Icons.filter_vintage, asset: 'assets/cotton.png'),
    _Category(label: 'Onion', icon: Icons.spa, asset: 'assets/onion.png'),
  ];

  void _navigateToPage(BuildContext context, String category) {
    Widget? page;
    
    switch (category) {
      case 'Sugarcane':
        page = const SugercanePage();
        break;
      case 'Tomato':
        page = const TomatoPage();
        break;
      case 'Mango':
        page = const MangoPage();
        break;
      case 'Cotton':
        page = const ShowPage();
        break;
      case 'Onion':
        page = const ZenduPage();
        break;
      default:
        page = CategoryDetailPage(label: category);
    }
    
    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: AppColors.textPrimary,
          onPressed: () {
            // TODO: handle menu tap
          },
        ),
        title: const Text(
          'AgroNursery',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                color: AppColors.textPrimary,
                onPressed: () {
                  // TODO: notification tap
                },
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search crops, seeds, tools',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    return _CategoryCard(
                      label: cat.label,
                      icon: cat.icon,
                      onTap: () {
                        _navigateToPage(context, cat.label);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Category {
  final String label;
  final IconData icon;
  final String asset;

  const _Category({
    required this.label,
    required this.icon,
    required this.asset,
  });
}

class _CategoryCard extends StatelessWidget {
  final String label;
  final Color? color;
  final IconData icon;
  final VoidCallback? onTap;

  const _CategoryCard({
    required this.label,
    required this.icon,
    this.color,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.12),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: (color ?? Colors.green).withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color ?? Colors.green, size: 28),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDetailPage extends StatelessWidget {
  final String label;
  const CategoryDetailPage({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
      ),
      body: Center(
        child: Text('Details for $label'),
      ),
    );
  }
}
