import 'package:flutter/material.dart';

TextEditingController name = TextEditingController();
TextEditingController signupEmail = TextEditingController();
TextEditingController signUpPassword = TextEditingController();
bool hidePassword = true;
bool passwordMatch = false;
bool hideConfirmPassword = true;
TextEditingController signUpPasswordconfirm = TextEditingController();
PageController pageController = PageController();
TextEditingController number = TextEditingController();

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white,
        elevation: 10,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: PageView(
            controller: pageController,
            children: [
              StatefulBuilder(
                builder: (context, state0) {
                  return Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("lib/assets/welcome.png")),
                      const SizedBox(height: 50),
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: signupEmail,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          obscureText: hidePassword,
                          controller: signUpPassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                state0(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () async {
                          // if (name.text.isEmpty) {
                          //   showsnackbar(context, "Enter name");
                          // }
                          // if (signupEmail.text.isEmpty ||
                          //     !signupEmail.text.contains("@")) {
                          //   showsnackbar(context, "Enter valid email");
                          // }
                          // if (signUpPassword.text.isEmpty) {
                          //   showsnackbar(context, "enter password");
                          // }
                          // if (signUpPassword.text.isNotEmpty &&
                          //     signupEmail.text.isNotEmpty &&
                          //     name.text.isNotEmpty) {
                          //   String state = "";
                          //   while (state.isEmpty) {
                          //     showDialog(
                          //       context: context,
                          //       builder: (context) {
                          //         return const Dialog(
                          //           backgroundColor: Colors.transparent,
                          //           child: Center(
                          //             child: CircularProgressIndicator(),
                          //           ),
                          //         );
                          //       },
                          //     );
                          //     state = await AuthMethods().createAccount(
                          //       email: signupEmail.text,
                          //       password: signUpPassword.text,
                          //       fullName: name.text,
                          //     );
                          //   }
                          //   Navigator.pop(context);
                          //   if (state == "email-already-in-use") {
                          //     showsnackbar(
                          //       context,
                          //       "Email Already in use, please login",
                          //     );
                          //   }
                          //   if (state == "invalid-email") {
                          //     showsnackbar(context, "Please use a valid email");
                          //   }
                          //   if (state == "network-request-failed") {
                          //     showsnackbar(context, "Failed check connection");
                          //   }
                          //   if (state == "weak-password") {
                          //     showsnackbar(context, "password is weak");
                          //   }
                          //   if (state == "Success") {
                          //     showsnackbar(context, "Welcome ${name.text}");
                          //     Navigator.pop(context);
                          //   } else {
                          //     showsnackbar(context, state);
                          //   }
                          // }
                        },

                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          height: 50,
                          width: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("Already have an account? "),
                            TextButton(
                              onPressed: () {
                                pageController.animateToPage(
                                  1,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.bounceInOut,
                                );
                              },
                              child: Text("Sign In"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              StatefulBuilder(
                builder: (context, state0) {
                  return Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("lib/assets/welcome.png")),
                      const SizedBox(height: 50),
                      const Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: signupEmail,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: signupEmail,
                          decoration: InputDecoration(
                            labelText: "Phone number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          obscureText: hidePassword,
                          controller: signUpPassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                state0(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          onChanged: (value) {
                            if (value != signUpPassword.text) {
                              state0(() {
                                passwordMatch = false;
                              });
                            } else {
                              state0(() {
                                passwordMatch = true;
                              });
                            }
                          },
                          controller: signUpPasswordconfirm,
                          obscureText: hideConfirmPassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                state0(() {
                                  hideConfirmPassword = !hideConfirmPassword;
                                });
                              },
                              icon: Icon(
                                hideConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: passwordMatch ? null : Colors.red,
                              ),
                            ),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                              color: passwordMatch ? null : Colors.red,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: passwordMatch
                                    ? Colors.black
                                    : Colors.red,
                                width: 3,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: passwordMatch
                                    ? Colors.black
                                    : Colors.red,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          // if (name.text.isEmpty) {
                          //   showsnackbar(context, "Enter name");
                          // }
                          // if (signupEmail.text.isEmpty ||
                          //     !signupEmail.text.contains("@")) {
                          //   showsnackbar(context, "Enter valid email");
                          // }
                          // if (signUpPassword.text.isEmpty) {
                          //   showsnackbar(context, "enter password");
                          // }
                          // if (signUpPassword.text.isNotEmpty &&
                          //     signupEmail.text.isNotEmpty &&
                          //     name.text.isNotEmpty) {
                          //   String state = "";
                          //   while (state.isEmpty) {
                          //     showDialog(
                          //       context: context,
                          //       builder: (context) {
                          //         return const Dialog(
                          //           backgroundColor: Colors.transparent,
                          //           child: Center(
                          //             child: CircularProgressIndicator(),
                          //           ),
                          //         );
                          //       },
                          //     );
                          //     state = await AuthMethods().createAccount(
                          //       email: signupEmail.text,
                          //       password: signUpPassword.text,
                          //       fullName: name.text,
                          //     );
                          //   }
                          //   Navigator.pop(context);
                          //   if (state == "email-already-in-use") {
                          //     showsnackbar(
                          //       context,
                          //       "Email Already in use, please login",
                          //     );
                          //   }
                          //   if (state == "invalid-email") {
                          //     showsnackbar(context, "Please use a valid email");
                          //   }
                          //   if (state == "network-request-failed") {
                          //     showsnackbar(context, "Failed check connection");
                          //   }
                          //   if (state == "weak-password") {
                          //     showsnackbar(context, "password is weak");
                          //   }
                          //   if (state == "Success") {
                          //     showsnackbar(context, "Welcome ${name.text}");
                          //     Navigator.pop(context);
                          //   } else {
                          //     showsnackbar(context, state);
                          //   }
                          // }
                        },

                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          height: 50,
                          width: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("Already have an account? "),
                            TextButton(
                              onPressed: () {
                                pageController.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.bounceInOut,
                                );
                              },
                              child: Text("Sign In"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
