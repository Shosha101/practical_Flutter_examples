import 'package:ex1/modules/login/password_updated.dart';
import 'package:ex1/modules/login/register_screen.dart';
import 'package:ex1/shared/components/component.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
class reset_password extends StatefulWidget {
  @override
  _reset_password createState() => _reset_password();
}
class _reset_password extends State<reset_password> {
  var controller_password = TextEditingController();

  String dearText='''
Your new password must be different from previous used passwords.
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
                  Icon(Icons.lock_reset_outlined,size: 100,color: Colors.grey,),
                  SizedBox(height: 30),
                  Text("Create New password",style: TextStyle(

                    fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,

                  )),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Text(dearText,style: TextStyle(

                      fontSize: 15,fontWeight: FontWeight.w400,color: Colors.blueGrey,

                    ),),
                  )
                  ,SizedBox(height: 60,),

                  default_textForm(
                      textColor: Colors.black,

                      cursorColor:Colors.black,
                      labelColor: Colors.black45,
                      BorderSideColor: Colors.green,
                      IconButtonColorPreffix:Colors.green ,
                      controller: controller_password,
                      keyboardtype: TextInputType.visiblePassword,
                      radius: 15,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Phone must not be empty.';
                        }
                      },
                      label: 'Password ',

                      prefix: Icons.lock
                  ),
                  SizedBox(height: 20),
                  default_textForm(
                      textColor: Colors.black,

                      cursorColor:Colors.black,
                      labelColor: Colors.black45,
                      BorderSideColor: Colors.green,
                      IconButtonColorPreffix:Colors.green ,
                      controller: controller_password,
                      keyboardtype: TextInputType.visiblePassword,
                      radius: 15,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Phone must not be empty.';
                        }
                      },
                      label: 'Confirm Password ',

                      prefix: Icons.lock
                  ),

                  SizedBox(height: 20),
                  default_button(

                    function: () {
                      if (formkey.currentState!.validate()) {//controller collect all data in the form from asking validator
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>password_update()));

                      }
                    },

                    isUpperCase: true,
                    fontsize: 25,
                    text: 'Create',
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
