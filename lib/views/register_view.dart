import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController loginController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter name'),
                    controller: nameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter email'),
                    controller: emailController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter login'),
                    controller: loginController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter password'),
                    controller: passwordController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text('Log in'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
