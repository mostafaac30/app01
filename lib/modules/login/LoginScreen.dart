import 'package:app01/shared/componants/componants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isVisable = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultTFF(
                      label: 'Email',
                      prefix: Icons.email,
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      validate: (value) {
                        if (value!.isEmpty) return 'not correct';
                        return null;
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultTFF(
                      isPassword: isVisable,
                      suffix:
                          isVisable ? Icons.visibility : Icons.visibility_off,
                      suffuxPressed: () {
                        setState(() {
                          isVisable = !isVisable;
                        });
                      },
                      label: 'Password',
                      prefix: Icons.lock,
                      inputType: TextInputType.visiblePassword,
                      controller: passwordController,
                      validate: (value) {
                        if (value!.isEmpty) return 'not correct';
                        return null;
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultButton(
                      function: () {
                        if (formKey.currentState!.validate())
                          print('Valid');
                        else
                          print('not valid');
                      },
                      text: 'Login'),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account? '),
                      TextButton(
                        onPressed: () {},
                        child: Text('Regester'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
