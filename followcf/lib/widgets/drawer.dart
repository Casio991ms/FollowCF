import 'package:flutter/material.dart';
import 'package:followcf/screens/all_submissions.dart';
import 'package:followcf/screens/following_users.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Center(
                child: Text(
              'Follow CF',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text(
              'All Submissions',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AllSubmissions()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Following Users',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const following()),
              );
            },
          ),
        ],
      ),
    );
  }
}
