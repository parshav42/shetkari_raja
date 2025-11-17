

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
// import '../screens/purchase_screen.dart';

class TomatoPage extends StatelessWidget {
  const TomatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lightRed = Color.lerp(Colors.red, Colors.white, 0.85)!;
    final lightOrange = Color.lerp(Colors.orange, Colors.white, 0.85)!;

    // Example items for tomato page grid
    const items = [
      _CardItem(label: 'Hybrid 1', asset: 'assets/images/tomato1.jpg'),
      _CardItem(label: 'Hybrid 2', asset: 'assets/images/tomato2.png'),
      _CardItem(label: 'Local 1', asset: 'assets/images/tomato3.png'),
      _CardItem(label: 'Cherry', asset: 'assets/images/tomato4.jpg'),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lightRed, lightOrange],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.textPrimary,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Tomato category',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
itemBuilder: (context, index) {
                final item = items[index];
                return _ImageCard(
                  label: item.label,
                  imageAsset: item.asset,
                  onTap: () {
                    // On tap, you might navigate to purchase screen or detail
                    // For now, let's show a snackbar as a placeholder
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: ${item.label}')),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CardItem {
  final String label;
  final String asset;
  const _CardItem({required this.label, required this.asset});
}

class _ImageCard extends StatelessWidget {
  final String label;
  final String imageAsset;
  final VoidCallback onTap;

  const _ImageCard({
    required this.label,
    required this.imageAsset,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                   bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imageAsset,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical:5, horizontal: 8.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

