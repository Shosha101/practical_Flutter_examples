
import 'package:ex1/modules/login/reset_password.dart';
import 'package:ex1/shared/components/component.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class verification extends StatefulWidget {
  @override
  _verification createState() => _verification();
}

class _verification extends State<verification> {
  var controller_email = TextEditingController();

  String dearText = '''
Don\'t worry.
Enter your email and we will send you a verification code to reset your password.
''';
  var formkey = GlobalKey<FormState>();
  bool ispassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => login_screen()));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text(
          "Verification",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
                  Icon(
                    Icons.verified_user_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    dearText,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  default_textForm(
                      textColor: Colors.black,
                      cursorColor: Colors.black,
                      labelColor: Colors.black45,
                      BorderSideColor: Colors.green,
                      IconButtonColorPreffix: Colors.green,
                      controller: controller_email,
                      keyboardtype: TextInputType.emailAddress,
                      radius: 15,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Phone must not be empty.';
                        }
                      },
                      label: 'Email ',
                      prefix: Icons.email_outlined),
                  SizedBox(height: 20),
                  default_button(
                    function: ()  {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => reset_password()));
                    },
                    isUpperCase: true,
                    fontsize: 25,
                    text: 'Send',
                    radius: 10,
                    button_padding: EdgeInsetsDirectional.all(10),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
