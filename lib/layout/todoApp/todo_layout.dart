import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:ex1/shared/components/component.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'cubit/Cubit.dart';
import 'cubit/States.dart';
var title_controller = TextEditingController();
var time_controller = TextEditingController();
var date_controller = TextEditingController();
var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();

class home_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {
        if (state is AppInsertDBState)
        {
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.Names_lay_screens[cubit.currentIndex]),
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  cubit.ChangIndex(value);
                },
                currentIndex: cubit.currentIndex,
                iconSize: 25,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add), label: "New"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.done_all), label: "Done"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive_outlined),
                      label: "Archived"),
                ]),
            floatingActionButton: FloatingActionButton(
                child: Icon(size: 30,cubit.FbI),
                onPressed: () {
                  print("pressed0");
                    if (cubit.isBottomSheetShown) {
                      print("pressed1");
                      if (formKey.currentState!.validate()) {
                        print("pressed1");
                        cubit.inserTo_Data_Base(

                            title: title_controller.text.toString(),
                            date: date_controller.text.toString(),
                            time: time_controller.text.toString()
                        );
                      }
                    }else {
                      scaffoldKey.currentState?.showBottomSheet(
                              (context) => Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                key:
                                formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    default_textForm(
                                        radius: 20,
                                        controller: title_controller,
                                        keyboardtype:
                                        TextInputType.text,
                                        onTap: () {
                                          print("title tapped");
                                        },
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return "\"title must not be empty\"";
                                          }
                                          return null;
                                        },
                                        label: "Title Task",
                                        prefix: CupertinoIcons
                                            .airplane),
                                    SizedBox(height: 20),
                                    default_textForm(
                                        radius: 20,
                                        onTap: () {
                                          showDatePicker(
                                              context:
                                              context,
                                              initialDate:
                                              DateTime
                                                  .now(),
                                              firstDate:
                                              DateTime
                                                  .now(),
                                              lastDate: DateTime
                                                  .parse(
                                                  "2024-05-03"))
                                              .then((value) {
                                            date_controller
                                                .text =
                                                DateFormat.yMMMd()
                                                    .format(
                                                    value!);
                                          });
                                        },
                                        controller:
                                        date_controller,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return "date must not be empty";
                                          }
                                          return null;
                                        },
                                        label: "Date",
                                        prefix:
                                        Icons.calendar_month,
                                        keyboardtype:
                                        TextInputType
                                            .datetime),
                                    SizedBox(height: 20),
                                    default_textForm(
                                        radius: 20,
                                        onTap: () {
                                          showTimePicker(
                                              context:
                                              context,
                                              initialTime:
                                              TimeOfDay
                                                  .now())
                                              .then((value) {
                                            time_controller
                                                .text =
                                                value!
                                                    .format(
                                                    context)
                                                    .toString();

                                            print(
                                                "value is: ${time_controller.text.toString()}");
                                          });
                                        },
                                        controller:
                                        time_controller,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return "time must not be empty";
                                          }
                                          return null;
                                        },
                                        label: "time",
                                        prefix: Icons
                                            .watch_later_outlined,
                                        keyboardtype:
                                        TextInputType
                                            .datetime)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          elevation: 50.0)
                          .closed
                          .then((value) {
                            cubit.changeBottomState(isShow: false, icon: Icons.edit);

                      });

                      cubit.changeBottomState(isShow: true, icon: Icons.add);
                    }

                }),
            body: ConditionalBuilder(
                condition: state is! AppGetDBLoadState,
                builder: (context) =>
                    cubit.widget_lay_screens[cubit.currentIndex],
                fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    )));
      },
    );
  }
}
