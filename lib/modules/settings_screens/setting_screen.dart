import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings",style: TextStyle(
        fontSize: 25.0,fontWeight: FontWeight.bold
      ),),
    );
  }
}