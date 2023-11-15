import 'package:ex1/modules/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/component.dart';

class register_screen extends StatefulWidget {
  @override
  _register_screen createState() => _register_screen();
}
class _register_screen extends State<register_screen> {
  var controller_name = TextEditingController();
  var controller_phone = TextEditingController();
  var controller_email = TextEditingController();
  var controller_password = TextEditingController();
  var controller_pin=TextEditingController();

  var formkey = GlobalKey<FormState>();
  bool ispassword=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",style: TextStyle(color: Colors.black),),centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(color: Colors.black, onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>login_screen()));
        },
            icon: Icon(Icons.arrow_back)),
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
                  Text("Create Account",style: TextStyle(

                    fontSize: 40,fontWeight: FontWeight.bold,

                  )),
                  Text("Create a new account",style: TextStyle(

                    fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey,

                  ),)
                  ,SizedBox(height: 60,),

                  default_textForm(
                      textColor: Colors.black,

                      cursorColor:Colors.black,
                      labelColor: Colors.black45,
                      BorderSideColor: Colors.green,
                      IconButtonColorPreffix:Colors.green ,
                      controller: controller_name,
                      keyboardtype: TextInputType.text,
                      radius: 15,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'name must not be empty.';
                        }
                      },
                      label: 'Name ',

                      prefix: Icons.person
                  ),SizedBox(height: 20,)
                  ,
                  default_textForm(
                      textColor: Colors.black,

                      cursorColor:Colors.black,
                      labelColor: Colors.black45,
                      BorderSideColor: Colors.green,
                      IconButtonColorPreffix:Colors.green ,
                      controller: controller_email,
                      keyboardtype: TextInputType.emailAddress,
                      radius: 15,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty.';
                        }
                      },
                      label: 'Email ',

                      prefix: Icons.email_outlined
                  ),
                  SizedBox(height: 20),
                  default_textForm(
                      textColor: Colors.black,

                      cursorColor:Colors.black,
                      labelColor: Colors.black45,
                      BorderSideColor: Colors.green,
                      IconButtonColorPreffix:Colors.green ,
                      controller: controller_phone,
                      keyboardtype: TextInputType.phone,
                      radius: 15,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'phone must not be empty.';
                        }
                      },
                      label: 'Phone ',

                      prefix: Icons.phone_android
                  ),
                  SizedBox(height: 20,)
                  ,
                  default_textForm(
                      textColor: Colors.black,
                      cursorColor:Colors.black45,
                      labelColor: Colors.black45,
                      BorderSideColor: Colors.green,
                      IconButtonColorPreffix:Colors.green ,
                      IconButtonColorSuffix: Colors.green,
                      controller: controller_password,
                      keyboardtype: TextInputType.visiblePassword,
                      radius: 15,
                      suffix: ispassword?Icons.remove_red_eye:Icons.visibility_off,
                      suffixPressed: () {
                        setState(() {
                          ispassword=!ispassword;
                        });

                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'password must not be empty.';
                        }
                        return null;
                      },
                      label: 'password ',
                      ispassword: ispassword,
                      prefix: Icons.lock_outline),

                  SizedBox(height: 20,),
                  default_textForm(
                      textColor: Colors.black,
                      cursorColor:Colors.black45,
                      labelColor: Colors.black45,
                      BorderSideColor: Colors.green,
                      IconButtonColorPreffix:Colors.green ,
                      IconButtonColorSuffix: Colors.green,
                      controller: controller_password,
                      keyboardtype: TextInputType.visiblePassword,
                      radius: 15,
                      suffix: ispassword?Icons.remove_red_eye:Icons.visibility_off,
                      suffixPressed: () {
                        setState(() {
                          ispassword=!ispassword;
                        });

                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'password must not be empty.';
                        }
                        return null;
                      },
                      label: 'Confirm password ',
                      ispassword: ispassword,
                      prefix: Icons.lock_outline),
                  SizedBox(height: 20),
                  default_button(
                    fontsize: 25,
                    

                    function: () {
                      if (formkey.currentState!.validate()) {//controller collect all data in the form from asking validator
                        print(controller_email.text);
                        print(controller_password.text);
                      }
                    },
                    isUpperCase: true,
                    text: 'CREATE ACCOUNT',

                    radius: 10
                    , button_padding: EdgeInsets.all(10),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>login_screen()));
                            },
                            child: Text("Login",style: TextStyle(color: Colors.green,),))
                      ],
                    ),
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