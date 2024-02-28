import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.deepPurple,
                  child: Column(
                    children: [
                      LottieBuilder.asset("assets/lottie/login2.json"),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: Container(
                    width: 360,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'WelCome',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: userNameController,
                                validator: (value) {
                                  var availableValue = value ?? '';
                                  if (availableValue.isEmpty) {
                                    return ("Username is required");
                                  }
                                  if (!availableValue.contains("@") ||
                                      !availableValue.endsWith("gmail.com")) {
                                    return ("Username should be a valid Gmail address");
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text(
                                    'E-Mail Id',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.check,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "Enter Your Password";
                                },
                                decoration: InputDecoration(
                                  label: Text(
                                    'Password',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  userNameController.clear();
                                  passwordController.clear();
                                }
                              },
                              child: Center(
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                      child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
