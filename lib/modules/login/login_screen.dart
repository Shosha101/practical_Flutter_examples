import 'package:ex1/modules/login/register_screen.dart';
import 'package:ex1/modules/login/verification.dart';
import 'package:ex1/shared/components/component.dart';
import 'package:flutter/material.dart';
class login_screen extends StatefulWidget {
  @override
  _login_screen createState() => _login_screen();
}
class _login_screen extends State<login_screen> {
  var controller_email = TextEditingController();
  var controller_password = TextEditingController();
  var controller_pin=TextEditingController();

  var formkey = GlobalKey<FormState>();
  bool ispassword=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
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
                  Icon(Icons.person_pin,size: 100,color: Colors.grey,),
                  Text("Welcome Back",style: TextStyle(

                    fontSize: 40,fontWeight: FontWeight.bold,

                  )),
                  Text("Sign to continue",style: TextStyle(

                    fontSize: 25,fontWeight: FontWeight.w400,color: Colors.grey,

                  ),)
                  ,SizedBox(height: 60,),

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
                      label: 'email ',

                      prefix: Icons.email
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
                      prefix: Icons.lock),

                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    TextButton(

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>verification()));

                        },
                        child: Text("Forget Password?",style: TextStyle(color: Colors.green)))
                  ],
                ),
              SizedBox(height: 20),
                  default_button(

                    function: () {
                      if (formkey.currentState!.validate()) {//controller collect all data in the form from asking validator

                      }
                    },

                    isUpperCase: true,
                    fontsize: 25,
                    text: 'Login',
                    radius: 10,
                    button_padding: EdgeInsetsDirectional.all(10),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don\'t have an account?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>register_screen()));

                            },
                            child: Text("Register Now",style: TextStyle(color: Colors.green),))
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
