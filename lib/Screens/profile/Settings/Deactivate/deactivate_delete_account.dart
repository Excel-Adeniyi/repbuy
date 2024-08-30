import 'package:flutter/material.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class DeactivateDeleteAccount extends StatelessWidget {
  const DeactivateDeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = calculateContainerWidth(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delete/Deactivate Account',
                  overflow: TextOverflow.fade,
                ),
                const Text(
                    'Nexttellar profile gives you the freedom to manage your account information',
                    overflow: TextOverflow.clip),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'lib/assets/deletebin.png',
                    height: 400,
                    width: 400,
                  ),
                ),
                const Center(
                  child: Text(
                    'Delete/Deactivate Account',
                  ),
                ),
                const Center(
                  child: Text(
                      'Are you sure you want to delete/deactivate your account ?'),
                ),
                const Text('This action can not be undone.'),
                TextButton(
                    onPressed: () {}, child: const Text('Delete Account'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
