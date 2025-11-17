import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/firestore_service.dart';
import '../models/order_model.dart';

class PurchaseScreen extends StatefulWidget {
  final VoidCallback? onBackToHome;
  const PurchaseScreen({super.key, this.onBackToHome});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _qtyCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _qtyCtrl.dispose();
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lightGreen = Color.lerp(AppColors.green, Colors.white, 0.85)!;
    final lightBlue = Color.lerp(AppColors.blue, Colors.white, 0.85)!;

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
            color: AppColors.textPrimary,
            onPressed: () {
              if (widget.onBackToHome != null) {
                widget.onBackToHome!();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          centerTitle: true,
          title: const Text(
            'Order',
            style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              children: [
                // Product summary card
                Material(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 96,
                          height: 92,
                          decoration: BoxDecoration(
                            color: AppColors.green.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.image, color: AppColors.green, size: 40),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mango Sapling (Kesar)', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.textPrimary)),
                              SizedBox(height: 6),
                              Text('Green Leaf Nursery', style: TextStyle(color: AppColors.textSecondary)),
                              SizedBox(height: 10),
                              Text('Price: ₹180', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                              SizedBox(height: 4),
                              Text('Available: 120', style: TextStyle(color: AppColors.textSecondary)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Form card
                Material(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _qtyCtrl,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Quantity',
                              hintText: 'Enter quantity',
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) return 'Please enter quantity';
                              final n = int.tryParse(v);
                              if (n == null || n <= 0) return 'Enter a valid number';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _nameCtrl,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              labelText: 'Farmer Name',
                              hintText: 'Enter your name',
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) return 'Please enter your name';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              hintText: 'Enter phone number',
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) return 'Please enter phone number';
                              if (v.trim().length < 10) return 'Enter a valid phone number';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _addressCtrl,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Address',
                              hintText: 'Village, Taluka, District, Pincode',
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) return 'Please enter address';
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Buy button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitting
                        ? null
                        : () async {
                      if (!(_formKey.currentState?.validate() ?? false)) return;

                      final args = (ModalRoute.of(context)?.settings.arguments as Map?) ?? {};
                      final buyerId = (args['buyerId'] as String?)?.trim() ?? '';
                      final productId = (args['productId'] as String?)?.trim() ?? '';
                      final sellerId = (args['sellerId'] as String?)?.trim() ?? '';
                      final price = (args['price'] as num?) ?? 0;

                      final qty = int.tryParse(_qtyCtrl.text.trim()) ?? 0;
                      final name = _nameCtrl.text.trim();
                      final phone = _phoneCtrl.text.trim();
                      final address = _addressCtrl.text.trim();

                      if (buyerId.isEmpty || productId.isEmpty || sellerId.isEmpty || price <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Missing product details. Please try again.')),
                        );
                        return;
                      }

                      setState(() => _submitting = true);
                      try {
                        final result = await FirestoreService.instance.createOrderIfNotExists(
                          buyerId: buyerId,
                          productId: productId,
                          sellerId: sellerId,
                          quantity: qty,
                          price: price,
                          buyerName: name,
                          phone: phone,
                          address: address,
                        );

                        final existed = result.existed;
                        final msg = existed ? 'Order already exists' : 'Order created';

                        await showDialog<void>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Success'),
                            content: Text(msg),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );

                        if (mounted) Navigator.of(context).pop<OrderModel>(result.order);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to place order: $e')),
                        );
                      } finally {
                        if (mounted) setState(() => _submitting = false);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
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
}