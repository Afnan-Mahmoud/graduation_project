import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../../Utilites/colors.dart';
import '../Start Page/startpage.dart';
import 'Signup.dart';

class LoginScreen extends StatefulWidget with InputValidationMixin {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }



  @override
  Widget build(BuildContext context) {
    return Expanded(child: Scaffold(
      resizeToAvoidBottomInset: false,
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Text(

            "LOGIN",
            style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: ToolsUtilites.primarycolor,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: MultiValidator([
    RequiredValidator(errorText: "* Required"),
    EmailValidator(errorText: "Enter valid email id"),
    ]),

              decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: Colors.amber, width: 8),
                ),
                labelText: 'Email',
                counterStyle: const TextStyle(color: Colors.grey,),
                hintText: 'Enter your Email id as abc@gmail.com',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(


              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              validator: MultiValidator([
                RequiredValidator(errorText: "* Required"),
                MinLengthValidator(6,
                    errorText: "Password should be atleast 6 characters"),
                MaxLengthValidator(15,
                    errorText:
                    "Password should not be greater than 15 characters")
              ]),
              //obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                labelText: 'Password',
                hintText: 'Enter secure Password',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                    fontSize: 12,
                    color: ToolsUtilites.primarycolor,
                    fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Colors.black38))),
                child: const Text(
                  'Log in ',
                  style: TextStyle(color: ToolsUtilites.primarycolor, fontSize: 12),
                ),
                onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const StartPage( )));
                  }
                ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              child: Center(
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text('Dont have an account? ',
                      style: TextStyle(color: ToolsUtilites.primarycolor, fontSize: 15,fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()),
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 14, color: ToolsUtilites.primarycolor),
                      )),
                )
              ],
            ),
          )),
          const SizedBox(
            height: 80,
          ),

            ],
          )

      ),
    ));
  }
}

mixin InputValidationMixin {
  bool isValidPassword(String password) => password.length == 6;
}
