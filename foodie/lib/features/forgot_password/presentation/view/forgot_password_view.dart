import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/view/login_view.dart';
import '../state/forgot_password_state.dart';
import '../viewmodel/forget_password_viewmodel.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final ValueNotifier<bool> obscurePasswordNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final forgotPasswordState = ref.watch(forgotPasswordViewModelProvider);
    final forgotPasswordViewModel =
    ref.watch(forgotPasswordViewModelProvider.notifier);

    // Listening for changes in the state to navigate on password reset success
    ref.listen<ForgotPasswordState>(forgotPasswordViewModelProvider,
            (previous, next) {
          if (next.isPasswordReset && previous != null && !previous.isPasswordReset) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginView()),
            );
          }
        });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Phone number input field
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.green),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            // Conditional rendering for OTP and New Password fields
            if (forgotPasswordState.isOtpSent) ...[
              TextFormField(
                controller: otpController,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<bool>(
                valueListenable: obscurePasswordNotifier,
                builder: (context, obscurePassword, child) {
                  return TextFormField(
                    controller: newPasswordController,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          obscurePasswordNotifier.value =
                          !obscurePasswordNotifier.value;
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    obscureText: obscurePassword,
                  );
                },
              ),
            ],
            const SizedBox(height: 20),
            // Displaying error message if present
            if (forgotPasswordState.errorMessage.isNotEmpty) ...[
              Text(
                forgotPasswordState.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 20),
            ],
            // Send OTP / Verify OTP button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: forgotPasswordState.isLoading
                  ? null
                  : () {
                if (!forgotPasswordState.isOtpSent) {
                  // Validate phone number before sending OTP
                  if (phoneNumberController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter your phone number'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    forgotPasswordViewModel.reqOtp(
                        int.parse(phoneNumberController.text));
                  }
                } else {
                  // Validate OTP and new password before verifying
                  if (otpController.text.isEmpty ||
                      newPasswordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all the fields'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    forgotPasswordViewModel.verifyOtpAndResetPassword(
                      int.parse(phoneNumberController.text),
                      otpController.text,
                      newPasswordController.text,
                    );
                  }
                }
              },
              child: forgotPasswordState.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                forgotPasswordState.isOtpSent ? 'Verify OTP' : 'Send OTP',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
