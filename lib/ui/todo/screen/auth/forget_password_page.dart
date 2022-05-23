import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TodoForgetPassword extends StatefulWidget {
  const TodoForgetPassword({Key? key}) : super(key: key);

  @override
  State<TodoForgetPassword> createState() => _TodoForgetPasswordState();
}

class _TodoForgetPasswordState extends State<TodoForgetPassword>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late TextEditingController emailEditingController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
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
              SizedBox(height: 50,),

              Text(
                "Forget Password",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              SizedBox(height: 30,),

              Text(
                "Email address",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      return " Please  enter the valid email address";
                    } else {
                      return null;
                    }
                  },
                  controller: emailEditingController,
                  decoration: InputDecoration(
                    fillColor: Colors.white54,
                    filled:true ,
                    hintText: "example@gmail.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid))),
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  color: Colors.amber,
                  onPressed: (){}, child:Text("Reset Password")),
              )
            ],
          ),
        )
      ],
    ));
  }
}
