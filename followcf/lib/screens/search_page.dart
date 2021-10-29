import 'package:flutter/material.dart';
import 'package:followcf/models/user.dart';
import 'package:followcf/utils/dio_client.dart';
import 'package:followcf/screens/user_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<user?> users = [];
  List<String> handles = [];
  final DioClient _dioClient = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
              hintText: "Search Users",
              hintStyle: TextStyle(color: Colors.white)),
          onChanged: (txt) async {
            if (txt != "") {
              setState(() {
                users = [];
              });
              handles = [txt];
              await _dioClient.getUsers(handles: handles).then((value) => {
                    users = value,
                    setState(() {}),
                  });
              // await Future.delayed(const Duration(seconds: 2));
            }
          },
        ),
      ),
      body: ListView(
        children: List.generate(
          users.length,
          (i) => ListTile(
            key: UniqueKey(),
            title: Text(users[i]!.handle),
            subtitle: Text(users[i]!.rating.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInfo(u: users[i]!)),
              );
            },
          ),
        ),
      ),
    );
  }
}
