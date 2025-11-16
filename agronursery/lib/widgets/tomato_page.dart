// import 'package:flutter/material.dart';
// import '../theme/app_theme.dart';
// import '../screens/purchase_screen.dart';
// import 'package:flutter/material.dart';
// import '../theme/app_theme.dart';

// class TomatoPage extends StatelessWidget {
//   const TomatoPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final lightRed = Color.lerp(Colors.red, Colors.white, 0.85)!;
//     final lightOrange = Color.lerp(Colors.orange, Colors.white, 0.85)!;

//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [lightRed, lightOrange],
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
//             'Tomato',
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
//                             color: Colors.red.withOpacity(0.12),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: const Icon(Icons.local_florist, color: Colors.red, size: 80),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           'Hybrid Tomato Seeds',
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           'Disease-resistant variety with high productivity',
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
//                         _buildDetailRow('Price', '₹320 per 10g pack'),
//                         _buildDetailRow('Available Stock', '200 packs'),
//                         _buildDetailRow('Germination Rate', '90%'),
//                         _buildDetailRow('Growing Season', '60-90 days'),
//                         _buildDetailRow('Water Requirement', 'Moderate'),
//                         _buildDetailRow('Soil Type', 'Well-drained, fertile'),
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
//                       backgroundColor: Colors.red,
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
// import '../screens/purchase_screen.dart';

class TomatoPage extends StatelessWidget {
  const TomatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lightRed = Color.lerp(Colors.red, Colors.white, 0.85)!;
    final lightOrange = Color.lerp(Colors.orange, Colors.white, 0.85)!;

    // Example items for tomato page grid
    final items = const [
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
                // return _ImageCard(
                //   label: item.label,
                //   imageAsset: item.asset,
                //   onTap: () {
                //     // On tap, you might navigate to purchase screen or detail
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (_) => const PurchaseScreen(),
                //       ),
                //     );
                //   },
                // );
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
    Key? key,
  }) : super(key: key);

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

