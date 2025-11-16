import 'package:flutter/material.dart';

class LoginOtpPage extends StatefulWidget {
  const LoginOtpPage({Key? key}) : super(key: key);

  @override
  State<LoginOtpPage> createState() => _LoginOtpPageState();
}

class _LoginOtpPageState extends State<LoginOtpPage> {
  final TextEditingController _mobileController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  void _onGetOtpPressed() {
    final mobile = _mobileController.text.trim();
    // TODO: validate mobile number
    // TODO: navigate to OTP verification screen / send OTP
    print("Get OTP for: $mobile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a transparent scaffold background so gradient container shows
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7CE78B), // adjust these to your green
              Color(0xFF5BC2E7), // adjust to your blue
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Placeholder for avatar / logo
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey, // placeholder color
                  // You can put child: Image.asset(...) if you have logo asset
                ),
                const SizedBox(height: 24),
                const Text(
                  'AgroNursery',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                // Mobile number input
                TextField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Mobile Number',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Get OTP button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onGetOtpPressed,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.white, // white button
                      foregroundColor: Colors.black, // text color
                    ),
                    child: const Text(
                      'Get OTP',
                      style: TextStyle(fontSize: 16),
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
