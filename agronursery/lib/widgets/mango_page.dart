import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/purchase_screen.dart';

class MangoPage extends StatelessWidget {
  const MangoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lightYellow = Color.lerp(Colors.yellow, Colors.white, 0.85)!;
    final lightOrange = Color.lerp(Colors.orange, Colors.white, 0.85)!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lightYellow, lightOrange],
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
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Mango',
            style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Product Image Card
                Material(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.eco, color: Colors.orange, size: 80),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Premium Mango Saplings',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Kesar & Alphonso varieties available',
                          style: TextStyle(color: AppColors.textSecondary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Details Card
                Material(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Crop Details',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow('Price', '₹180 per sapling'),
                        _buildDetailRow('Available Stock', '150 saplings'),
                        _buildDetailRow('Growth Success Rate', '85%'),
                        _buildDetailRow('Maturity Period', '3-5 years'),
                        _buildDetailRow('Water Requirement', 'Moderate'),
                        _buildDetailRow('Soil Type', 'Well-drained, slightly acidic'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Action Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PurchaseScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textSecondary)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

