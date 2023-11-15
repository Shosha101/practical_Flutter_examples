import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(32, 178, 136, 0.6588235294117647),
        leading: Icon(
          Icons.menu,
        ),
        title: Text("pillpal"),
        centerTitle: true,
        elevation: 25.2,
        actions: [
          IconButton(icon: Icon(Icons.notification_important), onPressed: prin),
          IconButton(
            icon: Text("hello"),
            onPressed: () {
              print("inside anonymous");
            },
          ),
        ],
      ),
      body: Container(
          child: Column(
            children: [

                 Padding(
                   padding: const EdgeInsets.all(50),
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadiusDirectional.only(topEnd:Radius.circular(20.0) )

                     ),
                     clipBehavior: Clip.antiAliasWithSaveLayer,

                     child: Stack(
                      alignment: Alignment.bottomCenter ,
                        children: [

                      Image(
                        width: 200,
                        height: 200,
                        image: NetworkImage(
                            'https://my.alfred.edu/zoom/_images/foster-lake.jpg'),
                        fit: BoxFit.cover,
                      )
                      ,
                      Container(
                        width: 200,
                        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),

                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          "Flower",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,

                            color: Colors.white

                          ),
                        ),
                      )
                ]),
                   ),
                 ),


            ],
          ),
        ),
      );

  }

  void prin() {
    print("hi shosha");
  }
}
