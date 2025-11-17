import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lightGreen = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;
    final lightBlue = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;

    const leads = [
      _LeadItem(name: 'Rahul Patil', crop: 'Mango Sapling', qty: '20'),
      _LeadItem(name: 'Sita Deshmukh', crop: 'Tomato Seeds', qty: '5 packets'),
      _LeadItem(name: 'Vijay Shinde', crop: 'Cotton Sapling', qty: '50'),
      _LeadItem(name: 'Anita Pawar', crop: 'Onion Seeds', qty: '10 packets'),
      _LeadItem(name: 'Mahesh Jadhav', crop: 'Sugarcane Setts', qty: '200'),
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
            'Leads',
            style: TextStyle(
                color: AppColors.textPrimary, fontWeight: FontWeight.w800),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          itemCount: leads.length,
          itemBuilder: (context, index) => _LeadCard(item: leads[index]),
        ),
      ),
    );
  }
}

class _LeadItem {
  final String name;
  final String crop;
  final String qty;
  const _LeadItem({required this.name, required this.crop, required this.qty});
}

class _LeadCard extends StatelessWidget {
  final _LeadItem item;
  const _LeadCard({required this.item});

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
            CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.blue.withOpacity(0.12),
              child: const Icon(Icons.person, color: AppColors.blue),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Text('Crop: ${item.crop}',
                      style: const TextStyle(color: AppColors.textSecondary)),
                  const SizedBox(height: 2),
                  Text('Quantity: ${item.qty}',
                      style: const TextStyle(color: AppColors.textSecondary)),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                textStyle: const TextStyle(fontWeight: FontWeight.w700),
              ),
              icon: const Icon(Icons.call, size: 18),
              label: const Text('Call'),
            ),
          ],
        ),
      ),
    );
  }
}
