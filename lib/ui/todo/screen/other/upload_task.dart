import 'package:flutter/material.dart';
import 'package:uui/ui/todo/widgets/constant.dart';
import 'package:uui/ui/todo/widgets/drawer_screen.dart';

class TodoUploadTaskScreen extends StatefulWidget {
  const TodoUploadTaskScreen({Key? key}) : super(key: key);

  @override
  _TodoUploadTaskScreenState createState() => _TodoUploadTaskScreenState();
}

class _TodoUploadTaskScreenState extends State<TodoUploadTaskScreen> {
  TextEditingController categoriesTaskController =
      TextEditingController(text: "choose category");
  TextEditingController tasktileController = TextEditingController();
  TextEditingController taskdescriptionController = TextEditingController();
  TextEditingController taskdeadlineController =
      TextEditingController(text: "choose task deadline ");
  final formkey = GlobalKey<FormState>();
  DateTime? picker;
  @override
  void dispose() {
    // TODO: implement dispose
    categoriesTaskController.dispose();
    tasktileController.dispose();
    taskdeadlineController.dispose();
    taskdeadlineController.dispose();

    super.dispose();
  }

  uploadTasks() {
    final isValidate = formkey.currentState!.validate();
    print("valid $isValidate");
  }

  void datepicker() async {
    picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(
          Duration(days: 0),
        ),
        lastDate: DateTime(2100));
    if (picker != null) {
      setState(() {
        taskdeadlineController.text =
            '${picker!.year} - ${picker!.month} - ${picker!.day}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(137, 71, 69, 69),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: TodoDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("All field are required",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 29,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildcategorietitle(title: "Task categories *"),
                          const SizedBox(
                            height: 20,
                          ),
                          buildtextformfield(
                              ena: false,
                              pree: () {
                                popupDialog(context);
                              },
                              value: "Task categories",
                              maxli: 1,
                              control: categoriesTaskController),
                          const SizedBox(
                            height: 20,
                          ),
                          buildcategorietitle(title: "Task title *"),
                          const SizedBox(
                            height: 20,
                          ),
                          buildtextformfield(
                              ena: true,
                              pree: () {},
                              value: "Task title",
                              maxli: 1,
                              control: tasktileController),
                          const SizedBox(
                            height: 20,
                          ),
                          buildcategorietitle(title: "Task description *"),
                          const SizedBox(
                            height: 20,
                          ),
                          buildtextformfield(
                              ena: true,
                              pree: () {},
                              value: "Task description",
                              maxli: 1,
                              control: taskdescriptionController),
                          const SizedBox(
                            height: 20,
                          ),
                          buildcategorietitle(title: "Task deadline date *"),
                          const SizedBox(
                            height: 20,
                          ),
                          buildtextformfield(
                              ena: false,
                              pree: () {
                                datepicker();
                              },
                              value: "Task deadline date",
                              maxli: 1,
                              control: taskdeadlineController),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 110,
                              child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Colors.cyan,
                                  child: Row(children: [
                                    Text(
                                      "Upload",
                                    ),
                                    Icon(Icons.upload),
                                  ]),
                                  onPressed: () {
                                    uploadTasks();
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildtextformfield({maxli, control, ena, value, pree}) {
    return InkWell(
      onTap: () {
        pree();
      },
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty) {
            return " submit";
          } else {
            return null;
          }
        },
        key: ValueKey(value),
        controller: control,
        enabled: ena,
        maxLines: maxli,
        maxLength: 100,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.amberAccent,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Text buildcategorietitle({title}) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
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
                    itemCount: Constants.taskCategoriesList.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                          onTap: () {
                            print("${Constants.taskCategoriesList[index]}");
                          },
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_rounded,
                                  color: Colors.pinkAccent),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child:
                                    Text(Constants.taskCategoriesList[index]),
                              )
                            ],
                          ));
                    })),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodoUploadTaskScreen()));
                  },
                  child: Text("close")),
              TextButton(onPressed: () {}, child: Text("cancel filter")),
            ],
          );
        });
  }
}
