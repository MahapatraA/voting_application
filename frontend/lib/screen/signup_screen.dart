import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    final nameCtrl = TextEditingController();
    final ageCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final aadharCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: ageCtrl, decoration: const InputDecoration(labelText: "Age")),
            TextField(controller: addressCtrl, decoration: const InputDecoration(labelText: "Address")),
            TextField(controller: aadharCtrl, decoration: const InputDecoration(labelText: "Aadhar")),
            TextField(controller: passwordCtrl, obscureText: true, decoration: const InputDecoration(labelText: "Password")),

            const SizedBox(height: 20),

            auth.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {
                final success = await auth.signup({
                  "name": nameCtrl.text,
                  "age": int.parse(ageCtrl.text),
                  "address": addressCtrl.text,
                  "aadharId": int.parse(aadharCtrl.text),
                  "password": passwordCtrl.text,
                });

                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Signup successful")),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Signup failed")),
                  );
                }
              },
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}