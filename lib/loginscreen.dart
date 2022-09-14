import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webndcrafttest/constants.dart';
import 'package:webndcrafttest/homescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);

    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void dispose() {
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SafeArea(
          child: Form(
            child: ListView(
              padding: const EdgeInsets.all(50),
              children: [
                Center(
                  child: Container(
                    child: const Text(
                      "Welcome to Login Screen",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: kPrimaryColor),
                    ),
                  ),
                ),
                h_size50,
                TextFormField(
                    controller: username_controller,
                    decoration: const InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'Enter Your Email Address',
                        helperText:
                            'Email address should contain lowerase letters',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    validator: (text) {
                      if (text == null ||
                          !(text.contains('@')) && text.isNotEmpty) {
                        return "Enter valid email address!";
                      }
                      return null;
                    }),
                SizedBox(height: 15),
                Container(
                  child: TextFormField(
                      controller: password_controller,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: "Enter Your Password",
                        helperText: "Password should contain numbers",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      obscuringCharacter: '*',
                      validator: (text) {
                        if (text == null ||
                            !(text.length <= 8) && text.isNotEmpty) {
                          return "Enter a valid password atmost 5 characters!";
                        }
                        return null;
                      }),
                ),
                h_size50,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(400, 60),
                      primary: kPrimaryColor,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    String username = username_controller.text;
                    String password = password_controller.text;
                    if (username != '' && password != '') {
                      print('Successfull');

                      logindata.setBool('login', false);
                      logindata.setString('username', username);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
