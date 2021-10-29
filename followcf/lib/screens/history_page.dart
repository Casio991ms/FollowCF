import 'package:flutter/material.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({Key? key, required this.handle}) : super(key: key);

  final String handle;

  @override
  _UserHistoryState createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.handle),
      ),
      body: ListView(),
    );
  }
}
