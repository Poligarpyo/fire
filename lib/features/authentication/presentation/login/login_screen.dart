import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_snackbar.dart';
import '../../../../constants/assets.dart';
import '../../../../router/app_router.dart';
import '../../domain/auth/auth_controller.dart';
import '../../domain/login_response.dart';
import '../register/register_dialog.dart';
import '../widgets/buildBrandSection.dart';
import '../widgets/buildDivider.dart';
import '../widgets/buildLoginButton.dart';
import '../widgets/buildModernTextField.dart';
import '../widgets/buildOptionsRow.dart';
import '../widgets/buildSocialLoginOptions.dart';
import '../widgets/buildWelcomeSection.dart';
import '../widgets/handleLogin.dart';
import 'auth_ui_model.dart';
import 'login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthUiModel authUiModel = ref.watch(loginControllerProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    ref.listen(loginControllerProvider,
        (AuthUiModel? previous, AuthUiModel next) {
      if (next.user != null) {
        _userNameController.text = next.user!.login;
        _passwordController.text = next.user!.password;
      }
    });
    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF0A0A0A) : const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 440),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Gap(40),
                        // Logo or Brand Icon
                        buildBrandSection(isDark),
                        const Gap(48),
                        // Welcome Text
                        buildWelcomeSection(isDark),
                        const Gap(40),
                        // Username Field
                        buildModernTextField(
                          controller: _userNameController,
                          focusNode: _usernameFocus,
                          hintText: 'Username',
                          icon: Icons.person_outline_rounded,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          isDark: isDark,
                          onFieldSubmitted: (_) {
                            _passwordFocus.requestFocus();
                          },
                        ),
                        const Gap(20),
                        // Password Field
                        buildModernTextField(
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          hintText: 'Password',
                          icon: Icons.lock_outline_rounded,
                          isPassword: true,
                          obscureText: !authUiModel.showPassword,
                          isDark: isDark,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => handleLogin(context, ref,
                              _userNameController, _passwordController),
                          suffixIcon: IconButton(
                            icon: Icon(
                              authUiModel.showPassword
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                              color: isDark
                                  ? Colors.grey.shade400
                                  : Colors.grey.shade600,
                              size: 22,
                            ),
                            onPressed: () => ref
                                .read(loginControllerProvider.notifier)
                                .updateShowPassword(!authUiModel.showPassword),
                          ),
                        ),
                        const Gap(16),
                        // Remember me & Forgot password
                        // buildOptionsRow(authUiModel, isDark, ref),
                        // const Gap(32),
                        // Login Button
                        buildLoginButton(context, authUiModel, isDark, ref,
                            _userNameController, _passwordController),
                        const Gap(24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
