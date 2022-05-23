import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uui/ui/todo/screen/auth/forget_password_page.dart';
import 'package:uui/ui/todo/screen/auth/sign_up_screen.dart';
import 'package:uui/ui/todo/screen/home/home.dart';

class TodoLoginScreen extends StatefulWidget {
  const TodoLoginScreen({Key? key}) : super(key: key);

  @override
  State<TodoLoginScreen> createState() => _TodoLoginScreenState();
}

class _TodoLoginScreenState extends State<TodoLoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late TextEditingController emailEditingController = TextEditingController();
  late TextEditingController passwordEditingController =
      TextEditingController();
  bool boo = false;
  final loginformkey = GlobalKey<FormState>();

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
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text("Don't have an accont ",
                        style: TextStyle(color: Colors.white)),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => TodoSignupScreen()));
                        },
                        child: Text("Register ",
                            style: TextStyle(color: Colors.blue))),
                  ],
                ),
                Form(
                  key: loginformkey,
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => TodoForgetPassword()));
                  },
                  child: Align(
                    child: Text(
                      "forget password ? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline),
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                ),
                SizedBox(height: 30),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    // submitform();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodoHomeScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      Text("Login"),
                      Icon(Icons.login),
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
}
