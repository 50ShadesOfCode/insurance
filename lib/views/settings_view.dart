import 'package:flutter/material.dart';
import 'package:insurance/di.dart';
import 'package:insurance/providers/api_provider.dart';
import 'package:insurance/providers/shared_prefs_provider.dart';
import 'package:insurance/views/register_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController loginController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  late int userId;

  @override
  void initState() {
    super.initState();
    userId = appLocator.get<SharedPrefsProvider>().getUserId();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (userId == -1)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter login'),
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
                          onPressed: () async {
                            await appLocator.get<ApiProvider>().login(
                                loginController.text, passwordController.text);
                            setState(() {
                              userId = appLocator
                                  .get<SharedPrefsProvider>()
                                  .getUserId();
                            });
                          },
                          child: const Text('Log in'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => const RegisterView(),
                    ),
                  )
                },
                child: const Text("Don't have an account? Register now"),
              ),
            ],
          )
        : Center(
            child: Column(
              children: <Widget>[
                const Text('Already signed in!'),
                TextButton(
                    child: const Text('Log out'),
                    onPressed: () async {
                      await appLocator.get<SharedPrefsProvider>().setUserId(-1);
                      setState(() {
                        userId = -1;
                      });
                    }),
              ],
            ),
          );
  }
}
