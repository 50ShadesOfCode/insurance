import 'package:flutter/material.dart';
import 'package:insurance/di.dart';
import 'package:insurance/models/request.dart';
import 'package:insurance/providers/api_provider.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  late List<Request> data;

  @override
  void initState() async {
    super.initState();
    data = await appLocator.get<ApiProvider>().getRequests();
  }

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
