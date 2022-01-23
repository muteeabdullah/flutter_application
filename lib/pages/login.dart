import 'package:flutter/material.dart';
import 'package:flutter_application/utils/routes.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login2.jpg",
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
                            labelText: "Enter User name",
                            hintText: " User Name"),
                        validator: (Value) {
                          if (Value!.isEmpty) {
                            return "enter some user name please";
                          }

                          return null;
                        },
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
                            labelText: "Enter Password", hintText: "Password"),
                        validator: (Value) {
                          if (Value!.isEmpty) {
                            return "enter some password please";
                          } else if (Value.length < 6) {
                            return "password length should be greater then 6";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              changebutton = true;
                            });
                            await Future.delayed(Duration(seconds: 1));
                            await Navigator.pushNamed(
                                context, Myroutes.HomeRoute);
                            setState(() {
                              changebutton = false;
                            });
                          }
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 30,
                          width: changebutton ? 50 : 150,
                          alignment: Alignment.center,
                          child: changebutton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          decoration: BoxDecoration(
                              // shape: changebutton
                              //        ?BoxShape.circle
                              //        :BoxShape.rectangle,
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.circular(changebutton ? 50 : 8)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
