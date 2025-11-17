import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';

class FarmerLoginScreen extends StatefulWidget {
  const FarmerLoginScreen({super.key});

  @override
  State<FarmerLoginScreen> createState() => _FarmerLoginScreenState();
}

class _FarmerLoginScreenState extends State<FarmerLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController();
  bool _otpSent = false;
  final _otpCtrl = TextEditingController();
  final _authService = AuthService();
  int _remainingSeconds = 120;
  Timer? _timer;
  bool _otpExpired = false;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _otpCtrl.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _remainingSeconds = 120;
    _otpExpired = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _otpExpired = true;
          _timer?.cancel();
        }
      });
    });
  }

  void _sendOtp() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await _authService.sendOtp(_phoneCtrl.text.trim());
        setState(() {
          _otpSent = true;
        });
        _startTimer();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP sent to your phone')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send OTP: $e')),
          );
        }
      }
    }
  }

  void _verifyOtp() async {
    final otp = _otpCtrl.text.trim();
    if (otp.length == 6) {
      try {
        await _authService.verifyOtp(otp, _phoneCtrl.text.trim());
        if (mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/farmer',
            (route) => false,
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid OTP: $e')),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid 6-digit OTP')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text(
          'Farmer Login',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Please enter your mobile number to receive OTP',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // Phone Number Field
              TextFormField(
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  hintText: 'Enter 10-digit mobile number',
                  counterText: '',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (v) {
                  final phone = v?.trim() ?? '';
                  if (phone.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  if (!RegExp(r'^[6-9]\d{9}$').hasMatch(phone)) {
                    return 'Please enter valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
              
              if (!_otpSent) ...[
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _sendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Send OTP',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
              
              if (_otpSent) ...[
                const SizedBox(height: 20),
                TextFormField(
                  controller: _otpCtrl,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: const InputDecoration(
                    labelText: 'OTP',
                    hintText: 'Enter 6-digit OTP',
                    counterText: '',
                    prefixIcon: Icon(Icons.security),
                  ),
                  validator: (v) {
                    final otp = v?.trim() ?? '';
                    if (otp.isEmpty) return 'Please enter OTP';
                    if (otp.length != 6) {
                      return 'OTP must be 6 digits';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 10),
                
                // OTP Timer Display
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _otpExpired
                          ? 'OTP expired'
                          : 'Resend OTP in $_remainingSeconds seconds',
                      style: TextStyle(
                        color: _otpExpired ? Colors.red : Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    if (_otpExpired)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _otpSent = false;
                            _otpCtrl.clear();
                          });
                        },
                        child: const Text('Change Number'),
                      ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Verify OTP Button
                ElevatedButton(
                  onPressed: _otpExpired ? null : _verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Verify OTP',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Resend OTP Button
                Center(
                  child: TextButton(
                    onPressed: _otpExpired ? _sendOtp : null,
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                        color: _otpExpired 
                            ? AppTheme.primaryColor 
                            : Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ],
              
              const SizedBox(height: 40),
              
              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
