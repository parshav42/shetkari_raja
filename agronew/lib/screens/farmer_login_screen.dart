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
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
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
                  const SizedBox(height: 16),
                  const Text(
                    'AgroNursery',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Card
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Farmer Login',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _phoneCtrl,
                              enabled: !_otpSent,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                hintText: 'Enter phone number',
                                prefixText: '+91 ',
                              ),
                              validator: (v) {
                                final t = v?.trim() ?? '';
                                if (t.isEmpty) {
                                  return 'Please enter phone number';
                                }
                                final digits =
                                    t.replaceAll(RegExp(r'[^0-9]'), '');
                                if (digits.length < 10) {
                                  return 'Enter a valid 10-digit phone number';
                                }
                                return null;
                              },
                            ),
                            if (_otpSent) ...[
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _otpCtrl,
                                keyboardType: TextInputType.number,
                                maxLength: 6,
                                decoration: const InputDecoration(
                                  labelText: 'OTP',
                                  hintText: 'Enter 6-digit OTP',
                                  counterText: '',
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
                            ],
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _otpSent
                                    ? (_otpExpired
                                        ? () {
                                            setState(() {
                                              _otpSent = false;
                                              _otpCtrl.clear();
                                            });
                                            _timer?.cancel();
                                            _sendOtp();
                                          }
                                        : _verifyOtp)
                                    : _sendOtp,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _otpSent && _otpExpired
                                      ? Colors.grey
                                      : AppColors.green,
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w800),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: Text(_otpSent
                                    ? (_otpExpired
                                        ? 'Resend OTP'
                                        : 'Verify OTP')
                                    : 'Send OTP'),
                              ),
                            ),
                            if (_otpSent) ...[
                              const SizedBox(height: 12),
                              Center(
                                child: Text(
                                  _otpExpired
                                      ? 'OTP expired'
                                      : 'OTP expires in ${_remainingSeconds}s',
                                  style: TextStyle(
                                    color: _otpExpired
                                        ? Colors.red
                                        : AppColors.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Didn't receive OTP? ",
                                    style: TextStyle(
                                        color: AppColors.textSecondary),
                                  ),
                                  TextButton(
                                    onPressed: _otpExpired
                                        ? () {
                                            setState(() {
                                              _otpSent = false;
                                              _otpCtrl.clear();
                                            });
                                            _timer?.cancel();
                                            _sendOtp();
                                          }
                                        : null,
                                    child: Text(
                                      'Resend',
                                      style: TextStyle(
                                        color: _otpExpired
                                            ? AppColors.green
                                            : AppColors.textSecondary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
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
