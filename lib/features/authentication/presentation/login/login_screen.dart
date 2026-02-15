import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_colors.dart';
import '../../../../router/app_router.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/handleLogin.dart';
import 'controller/login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _phone = FocusNode();

  @override
  void dispose() {
    _userNameController.dispose();
    _phone.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  // void _handleLogin() {
  //   // Handle login
  //   if (_userNameController.text.isEmpty || _phoneController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Please fill in all fields'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return;
  //   }
  // }

  void _handleCreateAccount() {
    context.go(SGRoute.register.route);
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

                // // Emergency SMS Report Button
                // _buildEmergencyButton(),

                const SizedBox(height: 32),

                // Login Form Card
                _buildLoginCard(),

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

  Widget _buildLoginCard() {
    final loginState = ref.watch(loginControllerProvider);

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
            // Header with Login and Create Account
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Citizen Login',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF424242),
                  ),
                ),
                TextButton.icon(
                  onPressed: _handleCreateAccount,
                  icon: const Icon(
                    Icons.person_add_outlined,
                    size: 18,
                    color: Color(0xFFD32F2F),
                  ),
                  label: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color(0xFFD32F2F),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            const Text(
              'For SMS alerts and verification',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9E9E9E),
              ),
            ),
            const SizedBox(height: 8),
            // Full Name Field
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
              hintText: 'Enter your password',
              prefixIcon: Icons.person_outline,
              obscureText: true,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(
                    r'[\u{1F600}-\u{1F64F}' // Emoticons
                    r'\u{1F300}-\u{1F5FF}' // Symbols & pictographs
                    r'\u{1F680}-\u{1F6FF}' // Transport & map
                    r'\u{1F700}-\u{1F77F}'
                    r'\u{1F780}-\u{1F7FF}'
                    r'\u{1F800}-\u{1F8FF}'
                    r'\u{1F900}-\u{1F9FF}'
                    r'\u{1FA00}-\u{1FAFF}'
                    r'\u{2600}-\u{26FF}' // Misc symbols
                    r'\u{2700}-\u{27BF}]', // Dingbats
                    unicode: true,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Login Button
            CustomButton(
              text: loginState.isLoading ? 'Logging in...' : 'Login as Citizen',
              icon: Icons.login,
              onPressed: () => handleLogin(
                context,
                ref,
                _phoneController,
                _passwordController,
              ),
            ),
            const SizedBox(height: 16),

            // Quick Login Text
            const Center(
              child: Text(
                'Quick login for registered users',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF9E9E9E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyHotline() {
    return const Column(
      children: [
        Text(
          'Emergency Hotline: 911',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
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
