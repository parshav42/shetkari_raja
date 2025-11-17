import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_model.dart';

class CreateOrderResult {
  final OrderModel order;
  final bool existed;
  CreateOrderResult({required this.order, required this.existed});
}

class FirestoreService {
  FirestoreService._();
  static final FirestoreService instance = FirestoreService._();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference get _orders => _db.collection('orders');
  CollectionReference get _users => _db.collection('users');

  Future<bool> orderExists({
    required String buyerId,
    required String productId,
  }) async {
    final q = await _orders
        .where('buyerId', isEqualTo: buyerId)
        .where('productId', isEqualTo: productId)
        .where('status', isEqualTo: 'pending')
        .limit(1)
        .get();
    return q.docs.isNotEmpty;
  }

  Future<OrderModel?> getExistingOrder({
    required String buyerId,
    required String productId,
  }) async {
    final q = await _orders
        .where('buyerId', isEqualTo: buyerId)
        .where('productId', isEqualTo: productId)
        .where('status', isEqualTo: 'pending')
        .limit(1)
        .get();
    if (q.docs.isEmpty) return null;
    return OrderModel.fromDoc(q.docs.first);
  }

  Future<CreateOrderResult> createOrderIfNotExists({
    required String buyerId,
    required String productId,
    required String sellerId,
    required int quantity,
    required num price,
    required String buyerName,
    required String phone,
    required String address,
  }) async {
    final existing =
        await getExistingOrder(buyerId: buyerId, productId: productId);
    if (existing != null) {
      return CreateOrderResult(order: existing, existed: true);
    }

    final total = price * quantity;
    final docRef = await _orders.add({
      'productId': productId,
      'buyerId': buyerId,
      'sellerId': sellerId,
      'quantity': quantity,
      'price': price,
      'total': total,
      'status': 'pending',
      'buyerName': buyerName,
      'phone': phone,
      'address': address,
      'createdAt': FieldValue.serverTimestamp(),
    });

    final createdSnap = await docRef.get();
    final created = OrderModel.fromDoc(createdSnap);
    return CreateOrderResult(order: created, existed: false);
  }

  Future<OrderModel?> getPendingOrder(String buyerId, String productId) =>
      getExistingOrder(buyerId: buyerId, productId: productId);

  Future<void> createOrUpdateUserProfile({
    required String uid,
    required String phoneNumber,
    String? role,
  }) async {
    await _users.doc(uid).set({
      'phoneNumber': phoneNumber,
      'role': role ?? 'farmer',
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>?> getUserProfile(String uid) async {
    final doc = await _users.doc(uid).get();
    return doc.exists ? doc.data() as Map<String, dynamic>? : null;
  }
}
