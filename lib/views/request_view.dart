import 'package:flutter/material.dart';
import 'package:insurance/di.dart';
import 'package:insurance/providers/api_provider.dart';
import 'package:insurance/providers/shared_prefs_provider.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key});

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late int userId;

  @override
  void initState() {
    super.initState();
    userId = appLocator.get<SharedPrefsProvider>().getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return userId != -1
        ? SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Make Request'),
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
                              border: OutlineInputBorder(),
                              hintText: 'Enter name'),
                          controller: nameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter description'),
                          controller: descriptionController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await appLocator.get<ApiProvider>().createRequest(
                                  nameController.text,
                                  descriptionController.text,
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Request sent')));
                          },
                          child: const Text('Create request'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SafeArea(
            child: Scaffold(
            body: Center(child: Text('Not logged in!')),
          ));
  }
}
