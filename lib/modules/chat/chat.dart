import 'package:flutter/material.dart';

class chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 8,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 23.0,
                backgroundColor: Colors.blueAccent,
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text("Chats", style: TextStyle(color: Colors.black45)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              child: IconButton(
                onPressed: () {
                  print("hello world");
                },
                icon: Icon(
                  Icons.camera_alt,
                  size: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(

              radius: 20,
              child: IconButton(
                onPressed: () {
                  print("hello world");
                },
                icon: Icon(
                  Icons.edit,
                  size: 25,
                ),
              ),
            ),
          ),
          SizedBox(width: 8,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),//space
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(25)),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.search_sharp),
                    SizedBox(width: 20),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),//search
            SizedBox(
              height: 20,
            ),//space
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 105,
                child: ListView.separated(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                    itemBuilder:(context, index) => item_Of_CellsRow(),
                  itemCount: 25,
                  separatorBuilder: (BuildContext context, int index) {return SizedBox(width: 20) ; },
                ),
              ),
            ), //row list view
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(top: 60),
                height: 500,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return item_Of_CellsColumn();
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 15,),
                    itemCount: 20),

              ),
            ),


          ],
        ),
      ),
    );
  }
//it's method that return widget and this widget have a model design for a cell in col List view .
  Widget item_Of_CellsColumn()=>Row(
    children: [
      Column(
        children: [
          Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(radius: 30),
                CircleAvatar(
                  radius: 8.5,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                    radius: 8.0,
                    backgroundColor:
                    Colors.lightGreenAccent)
              ]),
          SizedBox(height: 10),
        ],
      ),
      SizedBox(
        width: 10,
      ),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ahmed",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),maxLines: 1,
              overflow: TextOverflow.ellipsis,),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text("hello can i help you",maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle),
                  ),
                ),
                Text("02.00pm")
              ],
            )
          ],
        ),
      ),

    ],
  );


  //it's method that return widget and this widget have a model design for a cell in row List view .
  Widget item_Of_CellsRow()=>Container(
    width: 60,
    child: Column(
      children: [
        Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [

              CircleAvatar(radius: 30),
              CircleAvatar(
                
                radius: 8.5,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.lightGreenAccent),
              Image(image: AssetImage('images/IMG_9319.jpg'),width: 30,height: 30,),
            ]),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Ahmed Shosha",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );



}
