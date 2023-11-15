import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user_model/user_model.dart';

class users_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<user_model>users=[
      user_model(callerNames: "Mohamed Shosha", id: 1, callerNumber: "+01285857019")
      , user_model(callerNames: "Ahmed Shosha", id: 2, callerNumber: "+01281913317"),
      user_model(callerNames: "Mohamed Shosha", id: 1, callerNumber: "+01285857019")
      , user_model(callerNames: "Ahmed Shosha", id: 2, callerNumber: "+01281913317"),
      user_model(callerNames: "Mohamed Shosha", id: 1, callerNumber: "+01285857019")
      , user_model(callerNames: "Ahmed Shosha", id: 2, callerNumber: "+01281913317"),
      user_model(callerNames: "Mohamed Shosha", id: 1, callerNumber: "+01285857019")
      , user_model(callerNames: "Ahmed Shosha", id: 2, callerNumber: "+01281913317"),
      user_model(callerNames: "Mohamed Shosha", id: 1, callerNumber: "+01285857019")
      , user_model(callerNames: "Ahmed Shosha", id: 2, callerNumber: "+01281913317"),

    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Container(
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: users.length,
      ),
    );
  }
  Widget buildUserItem(user_model user)=>Container(
    padding: EdgeInsets.all(20.0),

    child: Row(
      children: [
        CircleAvatar(
          radius: 28,
          child: Text("${user.id}"),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.callerNames}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              Text("${user.callerNumber}",
                  style: TextStyle(color: Colors.blueGrey))
            ])
      ],
    ),
  );
}
