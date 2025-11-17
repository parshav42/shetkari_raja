// import 'package:flutter/material.dart';
// import '../theme/app_theme.dart';

// class NurseryLoginScreen extends StatefulWidget {
//   const NurseryLoginScreen({super.key});

//   @override
//   State<NurseryLoginScreen> createState() => _NurseryLoginScreenState();
// }

// class _NurseryLoginScreenState extends State<NurseryLoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _phoneCtrl = TextEditingController();
//   bool _otpSent = false;
//   final _otpCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _phoneCtrl.dispose();
//     _otpCtrl.dispose();
//     super.dispose();
//   }

//   void _sendOtp() {
//     if (_formKey.currentState?.validate() ?? false) {
//       setState(() {
//         _otpSent = true;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('OTP sent to your phone')),
//       );
//     }
//   }

//   void _verifyOtp() {
//     final otp = _otpCtrl.text.trim();
//     if (otp.length == 4) {
//       // Simulate successful verification
//       Navigator.of(context).pushNamedAndRemoveUntil(
//         '/nursery',
//         (route) => false,
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a valid 4-digit OTP')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final lightGreen = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;
//     final lightBlue = Color.lerp(AppColors.blue, AppColors.green, 0.85)!;

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
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ),
//         body: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Logo
//                   Container(
//                     width: 110,
//                     height: 110,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [AppColors.green, AppColors.blue],
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 18,
//                           offset: Offset(0, 8),
//                         ),
//                       ],
//                     ),
//                     child: const Center(
//                       child: Icon(Icons.eco, color: Colors.white, size: 50),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'AgroNursery',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // Login Card
//                   Material(
//                     color: Colors.white,
//                     elevation: 10,
//                     shadowColor: Colors.black.withValues(alpha: 0.12),
//                     borderRadius: BorderRadius.circular(18),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Nursery Owner Login',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w800,
//                                 color: AppColors.textPrimary,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             TextFormField(
//                               controller: _phoneCtrl,
//                               enabled: !_otpSent,
//                               keyboardType: TextInputType.phone,
//                               decoration: const InputDecoration(
//                                 labelText: 'Phone Number',
//                                 hintText: 'Enter phone number',
//                                 prefixText: '+91 ',
//                               ),
//                               validator: (v) {
//                                 final t = v?.trim() ?? '';
//                                 if (t.isEmpty) return 'Please enter phone number';
//                                 final digits = t.replaceAll(RegExp(r'[^0-9]'), '');
//                                 if (digits.length < 10) {
//                                   return 'Enter a valid 10-digit phone number';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             if (_otpSent) ...[
//                               const SizedBox(height: 16),
//                               TextFormField(
//                                 controller: _otpCtrl,
//                                 keyboardType: TextInputType.number,
//                                 maxLength: 4,
//                                 decoration: const InputDecoration(
//                                   labelText: 'OTP',
//                                   hintText: 'Enter 4-digit OTP',
//                                   counterText: '',
//                                 ),
//                                 validator: (v) {
//                                   final otp = v?.trim() ?? '';
//                                   if (otp.isEmpty) return 'Please enter OTP';
//                                   if (otp.length != 4) {
//                                     return 'OTP must be 4 digits';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ],
//                             const SizedBox(height: 20),
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: _otpSent ? _verifyOtp : _sendOtp,
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: AppColors.green,
//                                   foregroundColor: Colors.white,
//                                   padding: const EdgeInsets.symmetric(vertical: 16),
//                                   textStyle: const TextStyle(fontWeight: FontWeight.w800),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(14),
//                                   ),
//                                 ),
//                                 child: Text(_otpSent ? 'Verify OTP' : 'Send OTP'),
//                               ),
//                             ),
//                             if (_otpSent) ...[
//                               const SizedBox(height: 12),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Text(
//                                     "Didn't receive OTP? ",
//                                     style: TextStyle(color: AppColors.textSecondary),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         _otpSent = false;
//                                         _otpCtrl.clear();
//                                       });
//                                     },
//                                     child: const Text(
//                                       'Resend',
//                                       style: TextStyle(
//                                         color: AppColors.green,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // New User Registration Button - Outside Form
//                   SizedBox(
//                     width: double.infinity,
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pushNamed('/nursery-register');
//                       },
//                       style: TextButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         textStyle: const TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 16,
//                         ),
//                       ),
//                       child: const Text('New User? Register Here'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../theme/app_theme.dart';

// class NurseryLoginScreen extends StatefulWidget {
//   const NurseryLoginScreen({super.key});

//   @override
//   State<NurseryLoginScreen> createState() => _NurseryLoginScreenState();
// }

// class _NurseryLoginScreenState extends State<NurseryLoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _phoneCtrl = TextEditingController();
//   bool _otpSent = false;
//   final _otpCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _phoneCtrl.dispose();
//     _otpCtrl.dispose();
//     super.dispose();
//   }

//   void _sendOtp() {
//     if (_formKey.currentState?.validate() ?? false) {
//       setState(() {
//         _otpSent = true;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('OTP sent to your phone')),
//       );
//     }
//   }

//   void _verifyOtp() {
//     final otp = _otpCtrl.text.trim();
//     if (otp.length == 4) {
//       Navigator.of(context).pushNamedAndRemoveUntil(
//         '/nursery',
//         (route) => false,
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a valid 4-digit OTP')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Correct color interpolation as you described
//     final lightGreen = Color.lerp(AppColors.green, AppColors.blue, 0.85)!;
//     final lightBlue = Color.lerp(AppColors.blue, AppColors.green, 0.85)!;

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
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ),
//         body: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     width: 110,
//                     height: 110,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [AppColors.green, AppColors.blue],
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 18,
//                           offset: Offset(0, 8),
//                         ),
//                       ],
//                     ),
//                     child: const Center(
//                       child: Icon(Icons.eco, color: Colors.white, size: 50),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'AgroNursery',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   Material(
//                     color: Colors.white,
//                     elevation: 10,
//                     shadowColor: Colors.black.withOpacity(0.12),
//                     borderRadius: BorderRadius.circular(18),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Nursery Owner Login',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w800,
//                                 color: AppColors.textPrimary,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             TextFormField(
//                               controller: _phoneCtrl,
//                               enabled: !_otpSent,
//                               keyboardType: TextInputType.phone,
//                               decoration: const InputDecoration(
//                                 labelText: 'Phone Number',
//                                 hintText: 'Enter phone number',
//                                 prefixText: '+91 ',
//                               ),
//                               validator: (v) {
//                                 final t = v?.trim() ?? '';
//                                 if (t.isEmpty) return 'Please enter phone number';
//                                 final digits = t.replaceAll(RegExp(r'[^0-9]'), '');
//                                 if (digits.length < 10) {
//                                   return 'Enter a valid 10-digit phone number';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             if (_otpSent) ...[
//                               const SizedBox(height: 16),
//                               TextFormField(
//                                 controller: _otpCtrl,
//                                 keyboardType: TextInputType.number,
//                                 maxLength: 4,
//                                 decoration: const InputDecoration(
//                                   labelText: 'OTP',
//                                   hintText: 'Enter 4-digit OTP',
//                                   counterText: '',
//                                 ),
//                                 validator: (v) {
//                                   final otp = v?.trim() ?? '';
//                                   if (otp.isEmpty) return 'Please enter OTP';
//                                   if (otp.length != 4) {
//                                     return 'OTP must be 4 digits';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ],
//                             const SizedBox(height: 20),
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: _otpSent ? _verifyOtp : _sendOtp,
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: AppColors.green,
//                                   foregroundColor: Colors.white,
//                                   padding: const EdgeInsets.symmetric(vertical: 16),
//                                   textStyle: const TextStyle(fontWeight: FontWeight.w800),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(14),
//                                   ),
//                                 ),
//                                 child: Text(_otpSent ? 'Verify OTP' : 'Send OTP'),
//                               ),
//                             ),
//                             if (_otpSent) ...[
//                               const SizedBox(height: 12),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Text(
//                                     "Didn't receive OTP? ",
//                                     style: TextStyle(color: AppColors.textSecondary),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         _otpSent = false;
//                                         _otpCtrl.clear();
//                                       });
//                                     },
//                                     child: const Text(
//                                       'Resend',
//                                       style: TextStyle(
//                                         color: AppColors.green,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   SizedBox(
//                     width: double.infinity,
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pushNamed('/nursery-register');
//                       },
//                       style: TextButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         textStyle: const TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 16,
//                         ),
//                       ),
//                       child: const Text('New User? Register Here'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
