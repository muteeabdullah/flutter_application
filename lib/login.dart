import 'package:flutter/material.dart';

class login_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
       child: SingleChildScrollView(
        child:
       Column(
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
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
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
                  decoration: const InputDecoration(hintText: "Enter Password"),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('hi codepur');
                  },
                  child: Text('login',),
                  style: TextButton.styleFrom(),
                  
                )
              ],
            ),
          )
        ],
      ),
    )
    );
  }
}
