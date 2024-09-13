import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Image(
          image: AssetImage("assets/images/logo.png"),
          height: 60,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Help",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email Adress",
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide.none)),
                  style: const TextStyle(color: Colors.white),

                  // les validations du textbox pour l'email
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email adress";
                    } else if (!value.contains("@")) {
                      return "Please enter valid email adress";
                    } else if (!value.contains(".")) {
                      return "Please enter valid email adress";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure, // pour cacher le mot de passe
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none),
                    // pour ajouter le boutton de visibiliter du pwd
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        )),
                  ),
                  style: const TextStyle(color: Colors.white),

                  // les validations du textbox pour password
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // btn signin
                SizedBox(
                  width:
                      double.infinity, // pour prendre tout la place en largeur
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // si on entre ici ce que le validations sont correct
                          // code ....

                          //afichons les info taper
                          // print(_emailController.text);
                          // print(_passwordController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "OR",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width:
                      double.infinity, // pour prendre tout la place en largeur
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                    "Sign in is protect by Google reCAPTCHA to ensure you'are not a bot",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ],
            )),
      ),
    );
  }
}
