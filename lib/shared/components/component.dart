import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../layout/todoApp/cubit/Cubit.dart';

//default button component
Widget default_button(
        {
        required VoidCallback function,
        double width = double.infinity,
        Color color = Colors.blueAccent,
        double radius = 25,
        bool isUpperCase = true,
        required EdgeInsetsGeometry button_padding,
        double fontsize = 30,
        required String text}) =>
    Container(
      padding: button_padding,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.green,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white, fontSize: fontsize),
        ),
      ),
    );

//default text form component

Widget default_textForm({
  required TextEditingController controller,
  required TextInputType keyboardtype,
  void Function(String)? submit,
  void Function(String)? onChanged,
  void Function()? onTap,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Color cursorColor = Colors.blue,
  double radius = 0.0,
  bool ispassword = false,
  Color IconButtonColorSuffix = Colors.blue,
  Color IconButtonColorPreffix = Colors.blue,
  Color BorderSideColor = Colors.blue,
  void Function()? suffixPressed,
  Color textColor = Colors.blue,
  Color labelColor = Colors.blue,
}) =>
    Container(
      child: TextFormField(
        style: TextStyle(color: textColor),
        validator: validate,
        controller: controller,
        onChanged: onChanged,
        obscureText: ispassword,
        onTap: onTap,
        cursorColor: cursorColor,
        keyboardType: keyboardtype,
        onFieldSubmitted: submit,
        decoration: InputDecoration(
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: suffixPressed,
                  color: IconButtonColorSuffix,
                )
              : null,
          prefixIcon: Icon(
            prefix,
            color: IconButtonColorPreffix,
          ),
          labelText: label,
          labelStyle: TextStyle(color: labelColor),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: BorderSideColor),
              borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).DeleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text("${model['time']}"),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${model['title']}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${model['date']}",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(width: 20.0),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .UpdateData(status: 'done', id: model['id']);
                },
                icon: Icon(Icons.check_box),
                color: Colors.green[300]),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .UpdateData(status: 'archived', id: model['id']);
              },
              icon: Icon(Icons.archive),
              color: Colors.red[300],
            )
          ],
        ),
      ),
    );

Widget tasksBuilder({required List tasks}) => ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (BuildContext context) => ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
          separatorBuilder: (context, index) => mySeparator(),
          itemCount: tasks.length),
      fallback: (BuildContext context) => Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu,
              size: 30,
              color: Colors.blueGrey,
            ),
            SizedBox(height: 30),
            Text(
              "No Tasks Yet",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );

Widget mySeparator() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    );

Widget build_articleItem(article,context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                          "${article['title']}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1)),
                  Text("${article['publishedAt']}",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          )
        ],
      ),
    );


Widget articleBuilder(list,context)=>ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context)=>ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=>build_articleItem(list[index],context),
        separatorBuilder: (context,index)=>mySeparator(),
        itemCount: 19),
    fallback: (context)=>Center(child: CircularProgressIndicator())

);

void navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));