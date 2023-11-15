import 'package:ex1/shared/components/component.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
class password_update extends StatefulWidget {
  @override
  _password_update createState() => _password_update();
}
class _password_update extends State<password_update> {
  var controller_password = TextEditingController();

  String dearText='''
Your password has been updated
''';
  var formkey = GlobalKey<FormState>();
  bool ispassword=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>login_screen()));

        }, icon: Icon(Icons.arrow_back),color: Colors.black,),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text("Verification",style: TextStyle(color: Colors.black),),centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.update_rounded,size: 100,color: Colors.grey,),
                  SizedBox(height: 30),
                  Text("Password Updated",style: TextStyle(

                    fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,

                  )),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Text(dearText,style: TextStyle(

                      fontSize: 15,fontWeight: FontWeight.w400,color: Colors.blueGrey,

                    ),),
                  )
,



                  SizedBox(height: 20),
                  default_button(

                    function: () {
                      if (formkey.currentState!.validate()) {//controller collect all data in the form from asking validator
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>login_screen()));

                      }
                    },

                    isUpperCase: true,
                    fontsize: 25,
                    text: 'Sign In',
                    radius: 10,
                    button_padding: EdgeInsetsDirectional.all(10),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.only(top: 10),

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}
