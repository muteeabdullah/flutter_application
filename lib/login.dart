import 'package:flutter/material.dart';
import 'package:flutter_application/utils/routes.dart';

class login_page extends StatelessWidget {
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
              const Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Enter User Name"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration:
                          const InputDecoration(hintText: "Enter Password"),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Myroutes.HomeRoute
                        );
                      },
                      child: const Text('login'),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(50, 30),
                      ),
                      // style: TextButton.styleFrom(),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
