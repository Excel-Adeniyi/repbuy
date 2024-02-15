import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class CustomDialPad extends StatelessWidget {
  final TextEditingController pinController;

  const CustomDialPad({required this.pinController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DialButton('1', pinController: pinController),
            DialButton('2', pinController: pinController),
            DialButton('3', pinController: pinController),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DialButton('4', pinController: pinController),
            DialButton('5', pinController: pinController),
            DialButton('6', pinController: pinController),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DialButton('7', pinController: pinController),
            DialButton('8', pinController: pinController),
            DialButton('9', pinController: pinController),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DialButton(Icons.backspace, pinController: pinController),
            DialButton('0', pinController: pinController),
            DialButton(Icons.fingerprint, pinController: pinController),
          ],
        ),
      ],
    );
  }
}

class DialButton extends StatelessWidget {
  final dynamic text;
  final TextEditingController pinController;

  const DialButton(this.text, {required this.pinController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (text is String) {
            final currentText = pinController.text;
            if (currentText.length < 4) {
              pinController.text = currentText + text;
            }
          } else if (text == Icons.backspace) {
            // Handle backspace operation
            if (pinController.text.isNotEmpty) {
              pinController.text = pinController.text
                  .substring(0, pinController.text.length - 1);
            }
          } else if (text == Icons.check) {
            // Handle 'OK' (checkmark icon) action here
            // You can add your logic for the 'OK' action
          } else if (text == Icons.fingerprint) {
            // Handle fingerprint icon action here
            // You can add your logic for the fingerprint action
            authenticateWithBiometrics();
          }
        },
        child: text is String ? Text(text) : Icon(text),
      ),
    );
  }
}

Future<void> authenticateWithBiometrics() async {
  final localAuth = LocalAuthentication();
  bool isAuthenticated = false;

  try {
    isAuthenticated = await localAuth.authenticate(
      localizedReason:
          'Authenticate using fingerprint', // Explanation for the user
      // Allow biometric authentication to persist across app restarts
    );
  } catch (e) {
    print('Error during fingerprint authentication: $e');
  }

  if (isAuthenticated) {
    // Fingerprint authentication succeeded, you can now perform your desired action
    print('Fingerprint authentication succeeded!');
    // Add your logic to proceed with the action after successful fingerprint authentication
  } else {
    // Fingerprint authentication failed or was canceled
    print('Fingerprint authentication failed or canceled.');
    // You can handle this case as needed (e.g., show an error message)
  }
}
