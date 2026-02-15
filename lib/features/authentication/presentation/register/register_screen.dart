import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/app_colors.dart';
import '../../../../router/app_router.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleCreateAccount() {
    // Validate fields
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Check password match
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Remove non-digits (e.g., "+63", spaces, "-")
    final cleanedPhone = _passwordController.text.replaceAll(
      RegExp(r'[^0-9]'),
      '',
    );

    if (cleanedPhone.length != 10 || !cleanedPhone.startsWith('9')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Enter a valid 10-digit PH mobile number (e.g., 9123456789)',
          ),
        ),
      );
      return;
    }
    // Success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account Created Successfully'),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate back to login after a delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  void _handleBackToLogin() {
    context.go(SGRoute.login.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryRed,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Logo and Title
                _buildHeader(),
                const SizedBox(height: 32),

                // Create Account Form Card
                _buildCreateAccountCard(),
                const SizedBox(height: 32),

                // Emergency Hotline
                _buildEmergencyHotline(),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo Container
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: const Color(0xFFB71C1C),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.local_fire_department_rounded,
            size: 70,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),

        // Title
        const Text(
          'FireAlert System',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),

        // Subtitle
        const Text(
          'GPS-Based Emergency Response Platform',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildCreateAccountCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Create Account and Back to Login
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF424242),
                  ),
                ),
                TextButton.icon(
                  onPressed: _handleBackToLogin,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 18,
                    color: Color(0xFFD32F2F),
                  ),
                  label: const Text(
                    'Back to Login',
                    style: TextStyle(
                      color: Color(0xFFD32F2F),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Full Name Field
            const Text(
              'Full Name',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF616161),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _nameController,
              hintText: 'Enter your full name',
              prefixIcon: Icons.person_outline,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp("[a-zA-Z ]"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Mobile Number Field
            const Text(
              'Mobile Number',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF616161),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _phoneController,
              hintText: '912 345 6789',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
            ),

            const SizedBox(height: 8),
            const Text(
              'For SMS alerts and verification',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9E9E9E),
              ),
            ),

            const SizedBox(height: 20),

            // Address Field
            const Text(
              'Address',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF616161),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _addressController,
              hintText: 'Complete home address',
              prefixIcon: Icons.location_on_outlined,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'[\u{1F600}-\u{1FAFF}]', unicode: true),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Password Field
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF616161),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Create password',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'[\u{1F600}-\u{1FAFF}]', unicode: true),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Confirm Password Field
            const Text(
              'Confirm Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF616161),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _confirmPasswordController,
              hintText: 'Confirm password',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'[\u{1F600}-\u{1FAFF}]', unicode: true),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Create Account Button
            CustomButton(
              text: 'Create Account',
              onPressed: _handleCreateAccount,
              icon: Icons.person_add,
            ),

            const SizedBox(height: 16),

            // Agreement Text
            const Center(
              child: Text(
                'By creating an account, you agree to receive emergency alerts via SMS',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9E9E9E),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyHotline() {
    return Column(
      children: [
        const Text(
          'Emergency Hotline: 911',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Available 24/7 for fire emergencies',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
