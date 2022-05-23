import 'package:flutter/material.dart';
import 'package:uui/ui/todo/widgets/constant.dart';
import 'package:uui/ui/todo/widgets/drawer_screen.dart';
import 'package:uui/ui/todo/widgets/task_widgets.dart';

class TodoHomeScreen extends StatelessWidget {
  const TodoHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task "),
        actions: [
          IconButton(
              onPressed: () {
                popupDialog(context);
              },
              icon: Icon(Icons.filter_list_outlined))
        ],
      ),
      drawer: TodoDrawerWidget(),
      body: ListView.builder(itemBuilder: (context, index) {
        return TodoTaskWidgets();
      }),
    );
  }

  popupDialog(context) {
    
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Task Categories"),
            content: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:Constants.taskCategoriesList.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_rounded,
                                  color: Colors.pinkAccent),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(Constants.taskCategoriesList[index]),
                              )
                            ],
                          ));
                    })),
            actions: [
              TextButton(onPressed: () {}, child: Text("close")),
              TextButton(onPressed: () {}, child: Text("cancel filter")),
            ],
          );
        });
  }
}
