import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi_result_screen extends StatelessWidget{
   int result=0;
   bool isMale=true;
   int Age=20;
  Bmi_result_screen({
   required this.result,
    required this.isMale,
    required this.Age
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
        leading: IconButton( onPressed: () {  Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gender:${isMale }",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
            Text("Result:${result}",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
            Text("Age:${Age}",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),)



          ],
        ),
      ),

    );
  }
}