import 'package:flutter/material.dart';
import 'package:uui/ui/todo/widgets/drawer_screen.dart';

class TodoWorkersScreen extends StatefulWidget {
  const TodoWorkersScreen({Key? key}) : super(key: key);

  @override
  _TodoWorkersScreenState createState() => _TodoWorkersScreenState();
}

class _TodoWorkersScreenState extends State<TodoWorkersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        " All Workers ",
      )),
      drawer: TodoDrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          
          
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 8,
                    child: ListTile(
                      onTap: (){},
                      leading: Container(
                        decoration: BoxDecoration(border:Border(right: BorderSide(color:Colors.black))),
                        child: CircleAvatar(
                          radius: 30,
                          child: Image(image:AssetImage('assets/images/man.png',),),
                        ),
                      ),
                      title: Text(
                        "Worker name",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Icon(Icons.linear_scale_outlined),
                        Text(
                          "Post | 9802187634",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline)),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
