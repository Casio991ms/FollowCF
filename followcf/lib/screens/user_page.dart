import 'package:followcf/globals.dart';

import 'package:flutter/material.dart';
import 'package:followcf/models/user.dart';
import 'package:followcf/models/color.dart';
import 'package:followcf/screens/history_page.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key, required this.u}) : super(key: key);

  final User u;

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.u.handle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserHistory(u: widget.u)),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Card(
            borderOnForeground: true,
            color: const Color(0xFFDDDDDD),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.u.rank[0].toUpperCase() +
                            widget.u.rank.substring(1),
                        style: TextStyle(color: getColor(widget.u.rank)),
                      ),
                      Text(
                        widget.u.handle,
                        style: TextStyle(
                            color: getColor(widget.u.rank), fontSize: 22),
                      ),
                      Row(
                        children: [
                          if (widget.u.firstName != null &&
                              widget.u.lastName != null) ...[
                            Text(widget.u.firstName! + " " + widget.u.lastName!)
                          ] else if (widget.u.firstName != null) ...[
                            Text(widget.u.firstName!)
                          ] else if (widget.u.lastName != null) ...[
                            Text(widget.u.lastName!)
                          ],
                        ],
                      ),
                      Row(
                        children: [
                          if (widget.u.city != null) ...[Text(widget.u.city!)],
                          if ((widget.u.city != null) &&
                              widget.u.country != null) ...[Text(", ")],
                          if (widget.u.country != null) ...[
                            Text(widget.u.country!)
                          ],
                        ],
                      ),
                      if (widget.u.organization != null) ...[
                        Text(widget.u.organization!)
                      ],
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              text: "Contest rating: ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: widget.u.rating.toString(),
                              style: TextStyle(color: getColor(widget.u.rank)))
                        ]),
                      ),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                            const TextSpan(
                              text: "Max: ",
                            ),
                            TextSpan(
                                text: widget.u.maxRank[0].toUpperCase() +
                                    widget.u.maxRank.substring(1),
                                style: TextStyle(
                                    color: getColor(widget.u.maxRank))),
                            TextSpan(text: ", "),
                            TextSpan(
                                text: widget.u.maxRating.toString(),
                                style: TextStyle(
                                    color: getColor(widget.u.maxRank)))
                          ])),
                      Text("Contribution: ${widget.u.contribution}"),
                      Text("Friend of: ${widget.u.friendOfCount}"),
                      if (widget.u.email != null) ...[
                        Text("Email: ${widget.u.email}")
                      ],
                    ],
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 150),
                      child: Image.network(widget.u.titlePhoto)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                    handles.contains(widget.u.handle) ? "Following" : "Follow"),
                onPressed: () {
                  setState(() {
                    if (handles.contains(widget.u.handle) == true) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Removed ${widget.u.handle}')));
                      handles.remove(widget.u.handle);
                      users.remove(widget.u);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Added ${widget.u.handle}')));
                      users.add(widget.u);
                      handles.add(widget.u.handle);
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
