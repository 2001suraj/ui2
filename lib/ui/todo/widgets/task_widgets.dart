import 'package:flutter/material.dart';
import 'package:uui/ui/todo/screen/other/task_details.dart';

class TodoTaskWidgets extends StatelessWidget {
  const TodoTaskWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: ListTile(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      FlatButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            Text("delete",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 24)),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          },
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TodoTaskDetails()));
          },
          leading: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid))),
            child: CircleAvatar(
              radius: 20,
              child: Image(
                image: AssetImage('assets/images/check-mark.png'),
              ),
            ),
          ),
          title: Text(
            "title",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.linear_scale_outlined),
                Text("Subtitle / Task Description",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16))
              ]),
          trailing: Icon(Icons.keyboard_arrow_right)),
    );
  }
}
