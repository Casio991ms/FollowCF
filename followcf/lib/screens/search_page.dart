import 'package:flutter/material.dart';
import 'package:followcf/models/user.dart';
import 'package:followcf/models/color.dart';
import 'package:followcf/utils/dio_client.dart';
import 'package:followcf/screens/user_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<User> users = [];
  List<String> handles = [];
  final DioClient _dioClient = DioClient();

  Future func() async {
    return _dioClient.getUsers(handles: handles);
  }

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
              func().then((data) => {
                    setState(() {
                      users = data;
                    }),
                  });
            }
          },
        ),
      ),
      body: ListView(
        children: List.generate(
          users.length,
          (i) => ListTile(
            key: UniqueKey(),
            title: Text(users[i].handle,
                style: TextStyle(color: getColor(users[i].rank))),
            subtitle: Text(users[i].rating.toString(),
                style: TextStyle(color: getColor(users[i].rank))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInfo(u: users[i])),
              );
            },
          ),
        ),
      ),
    );
  }
}
