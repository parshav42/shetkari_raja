import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_text_field.dart';

class NurseryRegisterPage extends StatefulWidget {
  const NurseryRegisterPage({super.key});

  @override
  State<NurseryRegisterPage> createState() => _NurseryRegisterPageState();
}

class _NurseryRegisterPageState extends State<NurseryRegisterPage> {
  final _ownerController = TextEditingController();
  final _nurseryController = TextEditingController();
  final _contactController = TextEditingController();
  final _addressController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void dispose() {
    _ownerController.dispose();
    _nurseryController.dispose();
    _contactController.dispose();
    _addressController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    // Simple validation
    if (_ownerController.text.isEmpty ||
        _nurseryController.text.isEmpty ||
        _contactController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _locationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    // TODO: Implement actual registration logic here
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration successful!')),
    );
    
    // Navigate to nursery dashboard
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/nursery',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
           
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Container(
                    width: 110,
                    height: 110,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.green, AppColors.blue],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 18,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(Icons.eco, color: Colors.white, size: 50),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Owner Name
                  AnimatedTextField(
                    controller: _ownerController,
                    labelText: "Owner Name",
                    delay: 0,
                  ),

                  const SizedBox(height: 16),

                  // Nursery Name
                  AnimatedTextField(
                    controller: _nurseryController,
                    labelText: "Nursery Name",
                    delay: 200,
                  ),

                  const SizedBox(height: 16),

                  // Contact Number
                  AnimatedTextField(
                    controller: _contactController,
                    labelText: "Contact Number",
                    keyboardType: TextInputType.phone,
                    delay: 300,
                  ),

                  const SizedBox(height: 16),

                  // Address
                  AnimatedTextField(
                    controller: _addressController,
                    labelText: "Address",
                    delay: 400,
                  ),

                  const SizedBox(height: 16),

                  // Current Location
                  AnimatedTextField(
                    controller: _locationController,
                    labelText: "Current Location",
                    delay: 600,
                  ),

                  const SizedBox(height: 24),

                  // Register Button
                  AnimatedButton(
                    text: "Register",
                    onPressed: _handleRegister,
                    delay: 800,
                  ),

                  const SizedBox(height: 16),

                  // Already Register
                  AnimatedTextButton(
                    text: "Already Register? Login",
                    onPressed: () {
                      Navigator.of(context).pushNamed('/nursery-login');
                    },
                    delay: 1000,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
