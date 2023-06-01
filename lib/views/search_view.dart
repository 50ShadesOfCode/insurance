import 'package:flutter/material.dart';
import 'package:insurance/di.dart';
import 'package:insurance/providers/shared_prefs_provider.dart';
import 'package:insurance/views/admin_view.dart';
import 'package:insurance/views/user_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late String type;

  @override
  void initState() {
    super.initState();
    type = appLocator.get<SharedPrefsProvider>().getType();
  }

  @override
  Widget build(BuildContext context) {
    return type == 'User' ? UserView() : AdminView();
  }
}
