import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:io';
import 'dart:async';
import 'package:intl/intl.dart';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';

class UserListItem {
  String email;
  String nick;
  String timestamp;
  String water;

  UserListItem({this.email, this.nick, this.timestamp, this.water});
}

class UserList {
  List<UserListItem> userlist;

  UserList({this.userlist});
}

class EventSummary extends StatelessWidget {
  final _user = <UserList>[];

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("User")
          .orderBy("water", descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading . . .');
        final int messageCount = snapshot.data.documents.length;
        return ListView.builder(
          itemCount: messageCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            final dynamic message = document['Nick'];
            final dynamic water = document['water'];
            final dynamic bath = document['bath'];
            final dynamic kitchen = document['kitchen'];
            final dynamic cloth = document['cloth'];

            return ListTile(
                trailing: IconButton(
                  onPressed: () => document.reference.delete(),
                  icon: Icon(Icons.delete),
                ),
                isThreeLine: true,
                title: Text(
                  message != null ? message.toString() : '익명',
                ),
                //subtitle: Text('Message ${index + 1} of $messageCount'),
                subtitle: Text('$water 톤의 물을 사용했습니다!\n'
                    '화장실: $bath, 부엌: $kitchen, 세탁: $cloth'));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "사람들은 얼만큼 물을 사용하나요?",
          style: TextStyle(fontFamily: 'BMDOHYEON'),
        ),
      ),
      body: _buildUserList(),
    );
  }
}
