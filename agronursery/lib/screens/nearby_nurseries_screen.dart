import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NearbyNurseriesScreen extends StatelessWidget {
  const NearbyNurseriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lightGreen = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;
    final lightBlue = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;

    final items = const [
      _NurseryItem(
        nurseryName: 'Green Leaf Nursery',
        price: '₹180',
        stock: 'In stock: 120',
        cropLabel: 'Mango Sapling',
        color: AppColors.green,
      ),
      _NurseryItem(
        nurseryName: 'Shree Krushi Nursery',
        price: '₹60',
        stock: 'In stock: 540',
        cropLabel: 'Tomato Seeds',
        color: Color(0xFFE53935),
      ),
      _NurseryItem(
        nurseryName: 'Sai Agro Garden',
        price: '₹220',
        stock: 'In stock: 75',
        cropLabel: 'Cotton Sapling',
        color: Color(0xFF90A4AE),
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lightGreen, lightBlue],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          title: const Text(
            'Nearby Nurseries',
            style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          itemCount: items.length,
          itemBuilder: (context, index) => _NurseryCard(item: items[index]),
        ),
      ),
    );
  }
}

class _NurseryItem {
  final String nurseryName;
  final String price;
  final String stock;
  final String cropLabel;
  final Color color;
  const _NurseryItem({
    required this.nurseryName,
    required this.price,
    required this.stock,
    required this.cropLabel,
    required this.color,
  });
}

class _NurseryCard extends StatelessWidget {
  final _NurseryItem item;
  const _NurseryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.12),
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: item.color.withOpacity(0.18),
                  child: Icon(Icons.store_mall_directory, color: item.color),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.nurseryName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Container(
                  width: 96,
                  height: 80,
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.image, color: item.color, size: 40),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.cropLabel,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.stock,
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            item.price,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                              textStyle: const TextStyle(fontWeight: FontWeight.w700),
                            ),
                            child: const Text('Buy'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
