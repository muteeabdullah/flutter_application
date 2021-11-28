import 'package:flutter/material.dart';
import 'package:flutter_application/utils/routes.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome  $name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Enter User name", hintText: " User Name"),
                      onChanged: (Value) {
                        name = Value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Enter Password",
                          hintText: "Password"),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Myroutes.HomeRoute);
                      },
                      child: Container(
                        height : 30,
                        width: 140,
                        alignment: Alignment.center,
                        child: 
                        Text
                        ("login",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight : FontWeight.bold,
                        ),),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, Myroutes.HomeRoute);
                    //   },
                    //   child: const Text('login'),
                    //   style: TextButton.styleFrom(
                    //     minimumSize: const Size(50, 30),
                    //   ),
                      // style: TextButton.styleFrom(),
                    // )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
