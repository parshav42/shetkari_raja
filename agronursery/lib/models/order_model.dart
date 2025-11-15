import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String productId;
  final String buyerId;
  final String sellerId;
  final int quantity;
  final num price;
  final num total;
  final String status;
  final String buyerName;
  final String phone;
  final String address;
  final Timestamp? createdAt;

  OrderModel({
    required this.id,
    required this.productId,
    required this.buyerId,
    required this.sellerId,
    required this.quantity,
    required this.price,
    required this.total,
    required this.status,
    required this.buyerName,
    required this.phone,
    required this.address,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'buyerId': buyerId,
      'sellerId': sellerId,
      'quantity': quantity,
      'price': price,
      'total': total,
      'status': status,
      'buyerName': buyerName,
      'phone': phone,
      'address': address,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }

  factory OrderModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return OrderModel(
      id: doc.id,
      productId: data['productId'] as String? ?? '',
      buyerId: data['buyerId'] as String? ?? '',
      sellerId: data['sellerId'] as String? ?? '',
      quantity: (data['quantity'] as num?)?.toInt() ?? 0,
      price: data['price'] as num? ?? 0,
      total: data['total'] as num? ?? 0,
      status: data['status'] as String? ?? 'pending',
      buyerName: data['buyerName'] as String? ?? '',
      phone: data['phone'] as String? ?? '',
      address: data['address'] as String? ?? '',
      createdAt: data['createdAt'] is Timestamp ? data['createdAt'] as Timestamp : null,
    );
  }
}