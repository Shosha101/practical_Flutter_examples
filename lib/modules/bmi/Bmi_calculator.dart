import 'dart:math';

import 'package:ex1/modules/bmi_screen_result/Bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi_calculator extends StatefulWidget {
  @override
  State<Bmi_calculator> createState() => _Bmi_calculatorState();
}

class _Bmi_calculatorState extends State<Bmi_calculator> {
  bool isMale=false;
  double height=120.0;
  int weight=40;
  int age=20;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("BMI")),
      body: Column(
        //body divided into 4 sections,1-->one row have tow cells each cell have an col
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale=true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                         color: isMale?Colors.blue:CupertinoColors.systemGrey4,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Icon(Icons.male,size: 70,),
                            SizedBox(height: 10),
                            Text(
                              "Male",
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                  setState(() {
                    isMale=false;
                  });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color:!isMale?Colors.blue:CupertinoColors.systemGrey4,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.female,
                              size: 70,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Female",
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style:
                          TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height.round()}",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text("CM",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Slider(
                      value: height,
                      min: 80.0
                      ,max: 220.0,
                      onChanged: ( value) {
                      setState(() {
                      height=value;
                    }); },

                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  color: CupertinoColors.systemGrey4
                ),

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CupertinoColors.systemGrey4
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                          Text("${age}",style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              FloatingActionButton(

                                  onPressed:(){setState(() {
                                    age++;
                                  });},
                                  child: Icon(Icons.add),
                                mini: true,
                                heroTag: "ageAdd",
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },child: Icon(Icons.remove),mini: true,heroTag: "AgeMInus",)
                            ]
                            ,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10.0),
                        color: CupertinoColors.systemGrey4
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Weight",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                          Text("${weight}",style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              FloatingActionButton(
                                onPressed:(){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(Icons.add),
                                mini: true,
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },child: Icon(Icons.remove),mini: true,)
                            ]
                            ,
                          )
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: MaterialButton(
              child: Text("Calculate",style: TextStyle(color: Colors.white),),
              onPressed: () {
                  var result0=weight/pow(height/100, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Bmi_result_screen(result: result0.round(), isMale: isMale, Age: age,))
                  );
                  print(result0.round());
              },
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
