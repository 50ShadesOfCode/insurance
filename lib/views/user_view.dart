import 'package:flutter/material.dart';
import 'package:insurance/di.dart';
import 'package:insurance/models/request.dart';
import 'package:insurance/providers/api_provider.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Request>>(
        future: appLocator.get<ApiProvider>().getRequests(),
        builder: (context, AsyncSnapshot<List<Request>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  child:
                      Row(children: <Widget>[Text(snapshot.data![index].name)]),
                ),
              );
            } else {
              return const Center(child: Text('No requests'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
