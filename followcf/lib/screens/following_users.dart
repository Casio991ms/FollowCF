import 'package:followcf/globals.dart';

import 'package:followcf/screens/user_page.dart';
import 'package:followcf/utils/dio_client.dart';
import 'package:followcf/screens/search_page.dart';
import 'package:followcf/widgets/drawer.dart';
import 'package:flutter/material.dart';

class following extends StatefulWidget {
  const following({Key? key}) : super(key: key);

  @override
  _followingState createState() => _followingState();
}

class _followingState extends State<following> {
  final DioClient _dioClient = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: List.generate(
          users.length,
          (i) => ListTile(
            key: UniqueKey(),
            title: Text(users[i]!.handle),
            subtitle: Text(users[i]!.rating.toString()),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  handles.remove(users[i]!.handle);
                  users.removeAt(i);
                });
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInfo(u: users[i]!)),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});
          users = await _dioClient.getUsers(handles: handles);
          setState(() {});
        },
        child: const Icon(Icons.autorenew),
      ),
    );
  }
}
