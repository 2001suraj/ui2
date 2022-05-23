import 'package:flutter/material.dart';
import 'package:uui/ui/todo/screen/home/home.dart';
import 'package:uui/ui/todo/screen/other/profile_screeen.dart';
import 'package:uui/ui/todo/screen/other/upload_task.dart';
import 'package:uui/ui/todo/screen/other/worker_screen.dart';

class TodoDrawerWidget extends StatelessWidget {
  const TodoDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(color: Colors.cyanAccent),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(children: [
                SizedBox(height: 40),
                CircleAvatar(
                  radius: 40,
                  child:Image(image:AssetImage('assets/images/task.png'),),
                ),
                SizedBox(height: 30),
                Text("Work OS",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
              ])),
          SizedBox(height: 30),
          buildlisttile(tap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoHomeScreen()));
            
          }, icon: Icons.task, title: "All task"),
          buildlisttile(tap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoProfileScreen()));
            
          }, icon: Icons.settings, title: "My Account"),
          buildlisttile(
              tap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoWorkersScreen()));
                
              },
              icon: Icons.workspaces_outline,
              title: "Registered workers"),
          buildlisttile(
              tap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoUploadTaskScreen()));
              },
              icon: Icons.add_task,
              title: "Add task"),
          Divider(),
          buildlisttile(
              tap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(width: 10),
                            Text("Sign out"),
                          ],
                        ),
                        content: Text("Do you want to Sign out ?"),
                        actions: [
                          TextButton(onPressed: () {}, child: Text("yes")),
                          TextButton(onPressed: () {}, child: Text("No")),
                        ],
                      );
                    });
              },
              icon: Icons.logout,
              title: "Logout"),
        ],
      ),
    );
  }

  GestureDetector buildlisttile({icon, title, tap}) {
    return GestureDetector(
      onTap: tap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
}
