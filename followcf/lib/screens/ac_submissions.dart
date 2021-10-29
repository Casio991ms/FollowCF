import 'package:flutter/material.dart';
import 'package:followcf/widgets/drawer.dart';

class acSub extends StatefulWidget {
  const acSub({Key? key}) : super(key: key);

  @override
  State<acSub> createState() => _acSubState();
}

class _acSubState extends State<acSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accepted Submissions"),
      ),
      drawer: const MyDrawer(),
      // body: ListView(
      //   children: List.generate(
      //     submissions.length,
      //     (i) => ListTile(
      //       title: Text(submissions[i].contestId.toString() +
      //           submissions[i].index +
      //           ": " +
      //           submissions[i].name),
      //       subtitle: Text(submissions[i].author),
      //       isThreeLine: true,
      //       trailing: Text(submissions[i].rating.toString()),
      //     ),
      //   ),
      // ),
    );
  }
}
