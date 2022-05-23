import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uui/ui/todo/screen/auth/login_screen.dart';
import 'package:uui/ui/todo/widgets/constant.dart';

class TodoSignupScreen extends StatefulWidget {
  const TodoSignupScreen({Key? key}) : super(key: key);

  @override
  State<TodoSignupScreen> createState() => _TodoSignupScreenState();
}

class _TodoSignupScreenState extends State<TodoSignupScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late TextEditingController nameEditingController = TextEditingController();
  late TextEditingController emailEditingController = TextEditingController();
  late TextEditingController positionEditingController =
      TextEditingController(text: 'Company position');

  late TextEditingController phoneEditingController = TextEditingController();
  late TextEditingController passwordEditingController =
      TextEditingController();

  bool boo = false;
  final loginformkey = GlobalKey<FormState>();
  File? imagefile;

  submitform() {
    final isValid = loginformkey.currentState!.validate();
    print("valid $isValid");
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 30));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();

    super.initState();
  }

  showImageDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Please choose an option"),
            actions: [
              InkWell(
                onTap: () {
                  getimagefromcamera();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.camera, color: Colors.pink),
                      SizedBox(width: 12),
                      Text("Camera")
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  getimagefromgallery();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.image, color: Colors.pink),
                      SizedBox(width: 12),
                      Text("gallery")
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void getimagefromgallery() async {
    PickedFile? filepicked = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    setState(() {
      imagefile = File(filepicked!.path);
    });
  }

  void getimagefromcamera() async {
    PickedFile? filepicked = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://us.123rf.com/450wm/jirsak/jirsak1707/jirsak170700007/82255755-cybersecurity-and-information-technology-security-services-concept-login-or-sign-in-internet-concept.jpg?ver=6",
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Sign in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text("Already have an account  ",
                        style: TextStyle(color: Colors.white)),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => TodoLoginScreen()));
                        },
                        child: Text("Login ",
                            style: TextStyle(color: Colors.blue))),
                  ],
                ),
                Form(
                  key: loginformkey,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter a valid  user name";
                                } else {
                                  return null;
                                }
                              },
                              controller: nameEditingController,
                              obscureText: false,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "User full name",
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  errorBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: imagefile == null
                                      ? Icon(Icons.add_a_photo)
                                      : Image.file(imagefile!,
                                          fit: BoxFit.fill),
                                ),
                              )),
                          Transform.translate(
                            offset: Offset(-44, -102),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Color.fromARGB(255, 107, 240, 107),
                                child: IconButton(
                                  onPressed: () {
                                    showImageDialog();
                                  },
                                  icon: Icon(Icons.add_a_photo,
                                      color: Color.fromARGB(255, 5, 20, 22)),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains("@") ||
                              !value.contains(".com")) {
                            return "please enter a valid email address";
                          } else {
                            return null;
                          }
                        },
                        controller: emailEditingController,
                        obscureText: false,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "E-mail",
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter a valid email address";
                          } else {
                            return null;
                          }
                        },
                        controller: phoneEditingController,
                        obscureText: false,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Phone no",
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return "please enter a valid password";
                          } else {
                            return null;
                          }
                        },
                        controller: passwordEditingController,
                        obscureText: boo,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    boo = !boo;
                                  });
                                },
                                icon: Icon(boo
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            hintText: "pasword",
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          popupDialog(context);
                        },
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter a valid position";
                            } else {
                              return null;
                            }
                          },
                          controller: positionEditingController,
                          enabled: false,
                          obscureText: false,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Company position",
                              hintStyle: const TextStyle(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    submitform();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign Up"),
                      SizedBox(width: 20),
                      Icon(Icons.person_add),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                    itemCount: Constants.joblist.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                          onTap: () {
                            print("${Constants.joblist[index]}");
                          },
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_rounded,
                                  color: Colors.pinkAccent),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(Constants.joblist[index]),
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
                            builder: (context) => TodoSignupScreen()));
                  },
                  child: Text("close")),
              TextButton(onPressed: () {}, child: Text("cancel filter")),
            ],
          );
        });
  }
}
