import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MyStockScreen extends StatelessWidget {
  const MyStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final lightGreen = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;
    final lightBlue = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;


    const items = [
      _StockItem(label: 'Mango Sapling', qty: '120', price: '₹180', color: AppColors.green),
      _StockItem(label: 'Tomato Seeds', qty: '540', price: '₹60', color: Color(0xFFE53935)),
      _StockItem(label: 'Onion Seeds', qty: '300', price: '₹50', color: Color(0xFF8E24AA)),
      _StockItem(label: 'Cotton Sapling', qty: '75', price: '₹220', color: Color(0xFF90A4AE)),
      _StockItem(label: 'Sugarcane Setts', qty: '200', price: '₹15', color: Color(0xFF7CB342)),
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
            'My Stock',
            style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          itemCount: items.length,
          itemBuilder: (context, index) => _StockCard(item: items[index]),
        ),
      ),
    );
  }
}

class _StockItem {
  final String label;
  final String qty;
  final String price;
  final Color color;
  const _StockItem({required this.label, required this.qty, required this.price, required this.color});
}

class _StockCard extends StatelessWidget {
  final _StockItem item;
  const _StockCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.12),
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.image, color: item.color),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text('Qty: ${item.qty}', style: const TextStyle(color: AppColors.textSecondary)),
                      const SizedBox(width: 12),
                      Text('Price: ${item.price}', style: const TextStyle(color: AppColors.textSecondary)),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: AppColors.textSecondary),
              onPressed: () {},
              tooltip: 'Edit',
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: AppColors.textSecondary),
              onPressed: () {},
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}
