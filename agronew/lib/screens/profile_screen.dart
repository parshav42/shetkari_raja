import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/app_theme.dart';
import '../services/firestore_service.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback? onBackToHome;
  const ProfileScreen({super.key, this.onBackToHome});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _userProfile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final profile = await FirestoreService.instance.getUserProfile(user.uid);
      setState(() {
        _userProfile = profile;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final lightGreen = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;
    final lightBlue = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;

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
            'Profile',
            style: TextStyle(
                color: AppColors.textPrimary, fontWeight: FontWeight.w800),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              children: [
                Material(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 42,
                                backgroundColor:
                                    AppColors.green.withOpacity(0.15),
                                child: const Icon(Icons.person,
                                    color: AppColors.green, size: 40),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _userProfile?['name'] ?? 'User',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.textPrimary),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _userProfile?['phoneNumber'] ??
                                    'Phone not available',
                                style: const TextStyle(
                                    color: AppColors.textSecondary),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _userProfile?['address'] ?? 'Address not set',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.textSecondary),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: AppColors.green,
                                        side: const BorderSide(
                                            color: AppColors.green),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      child: const Text('Edit Profile'),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.green,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      child: const Text('Logout'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
