<<<<<<< HEAD:agronursery/lib/widgets/sugercane_page.dart
// import 'package:flutter/material.dart';
// import '../theme/app_theme.dart';
// import '../screens/purchase_screen.dart';
// import 'package:flutter/material.dart';
// import '../theme/app_theme.dart';

// class SugercanePage extends StatelessWidget {
//   const SugercanePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final lightGreen = Color.lerp(AppColors.green, Colors.white, 0.85)!;
//     final lightBlue = Color.lerp(AppColors.blue, Colors.white, 0.85)!;

//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [lightGreen, lightBlue],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 2,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             color: AppColors.textPrimary,
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           title: const Text(
//             'Sugarcane categories',
//             style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800),
//           ),
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 // Product Image Card
//                 Material(
//                   color: Colors.white,
//                   elevation: 10,
//                   shadowColor: Colors.black.withOpacity(0.12),
//                   borderRadius: BorderRadius.circular(18),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 200,
//                           decoration: BoxDecoration(
//                             color: AppColors.green.withOpacity(0.12),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: const Icon(Icons.grass, color: AppColors.green, size: 80),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           'Premium Sugarcane Seeds',
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           'High-yield variety suitable for commercial farming',
//                           style: TextStyle(color: AppColors.textSecondary),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
                
//                 // Details Card
//                 Material(
//                   color: Colors.white,
//                   elevation: 10,
//                   shadowColor: Colors.black.withOpacity(0.12),
//                   borderRadius: BorderRadius.circular(18),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Crop Details',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
//                         ),
//                         const SizedBox(height: 16),
//                         _buildDetailRow('Price', '₹45 per kg'),
//                         _buildDetailRow('Available Stock', '500 kg'),
//                         _buildDetailRow('Germination Rate', '95%'),
//                         _buildDetailRow('Growing Season', '12-18 months'),
//                         _buildDetailRow('Water Requirement', 'High'),
//                         _buildDetailRow('Soil Type', 'Loamy, Well-drained'),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
                
//                 // Action Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const PurchaseScreen(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.green,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//                     ),
//                     child: const Text('Buy Now'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: const TextStyle(color: AppColors.textSecondary)),
//           Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
//         ],
//       ),
//     );
//   }
// } 

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
=======
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/purchase_screen.dart';
>>>>>>> 806732a6b079dc0f337745816a4cb371257f3749:agronew/lib/widgets/sugercane_page.dart

class SugercanePage extends StatelessWidget {
  const SugercanePage({super.key});

  @override
  Widget build(BuildContext context) {
    final lightGreen = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;
    final lightBlue = Color.lerp(AppColors.blue, AppColors.green, 0.85)!;


    // Example list of items for the grid — replace these with your actual items & assets
    final items = const [
      _CardItem(label: '86032', asset: 'assets/images/86032.png'),
      _CardItem(label: '10001', asset: 'assets/images/10001.png'),
      _CardItem(label: '265', asset: 'assets/images/265.png'),
      _CardItem(label: '8005', asset: 'assets/images/8005.jpg'),
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromARGB(255, 12, 11, 11),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
<<<<<<< HEAD:agronursery/lib/widgets/sugercane_page.dart
            'Sugarcane categories',
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
                    // You can handle onTap here if you want to navigate or do something
                  },
                );
              },
=======
            'Sugarcane',
            style: TextStyle(
                color: AppColors.textPrimary, fontWeight: FontWeight.w800),
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
                            color: AppColors.green.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.grass,
                              color: AppColors.green, size: 80),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Premium Sugarcane Seeds',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'High-yield variety suitable for commercial farming',
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
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary),
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow('Price', '₹45 per kg'),
                        _buildDetailRow('Available Stock', '500 kg'),
                        _buildDetailRow('Germination Rate', '95%'),
                        _buildDetailRow('Growing Season', '12-18 months'),
                        _buildDetailRow('Water Requirement', 'High'),
                        _buildDetailRow('Soil Type', 'Loamy, Well-drained'),
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
                      backgroundColor: AppColors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text('Buy Now'),
                  ),
                ),
              ],
>>>>>>> 806732a6b079dc0f337745816a4cb371257f3749:agronew/lib/widgets/sugercane_page.dart
            ),
          ),
        ),
      ),
    );
  }
}

<<<<<<< HEAD:agronursery/lib/widgets/sugercane_page.dart
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Wrap image in a Padding so it gets space from card edges
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
                  // adjust to your desired image height
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Label part, bottom white panel
            Container(
              width: 100,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  // color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
=======
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textSecondary)),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        ],
>>>>>>> 806732a6b079dc0f337745816a4cb371257f3749:agronew/lib/widgets/sugercane_page.dart
      ),
    );
  }
}
