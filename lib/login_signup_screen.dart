import 'package:flutter/material.dart';
import 'package:signin_signup_ui/constants/constant.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isMale = true;

  bool isSignupScreen = true;

  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      body: Stack(children: [
        imagePosition(),
        buildBottomHalfContainer(true),
        animatedPositionContainer(context),
        buildBottomHalfContainer(false),
        bottomTextButton(context),
      ]),
    );
  }

  Positioned bottomTextButton(BuildContext context) => Positioned(
        top: MediaQuery.of(context).size.height - 100,
        right: 0,
        left: 0,
        child: Column(
          children: [
            Text(isSignupScreen ? 'Or signup with' : 'Signin with'),
            Container(
              margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTextButton(
                    Icons.facebook,
                    'Facebook',
                    Constant.facebookColor,
                  ),
                  buildTextButton(
                      Icons.facebook, 'Google', Constant.googleColor)
                ],
              ),
            ),
          ],
        ),
      );

  AnimatedPositioned animatedPositionContainer(BuildContext context) =>
      AnimatedPositioned(
        duration: const Duration(milliseconds: 700),
        top: isSignupScreen ? 220.0 : 240,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.bounceInOut,
          height: isSignupScreen ? 380 : 270,
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 5,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignupScreen = false;
                        });
                      },
                      child: Column(children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: !isSignupScreen
                                ? Constant.activeColor
                                : Constant.txetColor2,
                          ),
                        ),
                        if (!isSignupScreen)
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          ),
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignupScreen = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'SIGNUP',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: isSignupScreen
                                  ? Constant.activeColor
                                  : Constant.txetColor2,
                            ),
                          ),
                          if (isSignupScreen)
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 2,
                              width: 55,
                              color: Colors.orange,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (isSignupScreen) buildSignupSection(),
                if (!isSignupScreen) buildSigninSection(),
              ],
            ),
          ),
        ),
      );

  Positioned imagePosition() => Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: SingleChildScrollView(
          child: Container(
            height: 300.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      );

  Container buildSigninSection() => Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            buildTextField(
              Icons.email_outlined,
              'dhruvi@gmail.com',
              false,
              true,
            ),
            const SizedBox(height: 20.0),
            buildTextField(
              Icons.lock_outline,
              '******',
              true,
              false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: isRememberMe,
                        activeColor: Constant.txetColor2,
                        onChanged: (value) {
                          setState(() {
                            isRememberMe = !isRememberMe;
                          });
                        }),
                    const Text('Remember me'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Constant.textColor1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Container buildSignupSection() => Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: buildTextField(
                Icons.person_outline,
                'Username',
                false,
                false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: buildTextField(
                Icons.email_outlined,
                'Email',
                false,
                true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: buildTextField(
                Icons.lock_outline,
                'Password',
                true,
                false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                            color: isMale
                                ? Constant.txetColor2
                                : Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color: isMale
                                  ? Colors.transparent
                                  : Constant.textColor1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.person_outline,
                            color: isMale ? Colors.white : Constant.iconColor,
                          ),
                        ),
                        const Text(
                          'Male',
                          style: TextStyle(
                            color: Constant.textColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                            color: isMale
                                ? Colors.transparent
                                : Constant.txetColor2,
                            border: Border.all(
                              width: 1,
                              color: isMale
                                  ? Constant.textColor1
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.person_outline,
                            color: isMale ? Constant.iconColor : Colors.white,
                          ),
                        ),
                        const Text(
                          'Female',
                          style: TextStyle(
                            color: Constant.textColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 200.0,
              margin: const EdgeInsets.only(top: 20.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'By pressing submit you agree to our',
                  style: TextStyle(
                    color: Constant.txetColor2,
                  ),
                  children: [
                    TextSpan(
                      text: "Term & conditions",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  TextButton buildTextButton(
          IconData icon, String title, Color backgroundColor) =>
      TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          side: const BorderSide(width: 1, color: Colors.grey),
          minimumSize: const Size(155, 40),
          backgroundColor: backgroundColor,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Text(title),
          ],
        ),
      );

  Widget buildBottomHalfContainer(bool showShadow) => AnimatedPositioned(
        duration: const Duration(milliseconds: 700),
        curve: Curves.bounceInOut,
        top: isSignupScreen ? 555.0 : 460,
        right: 0,
        left: 0,
        child: Center(
          child: Container(
            height: 90.0,
            width: 90.0,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
              ],
            ),
            child: !showShadow
                ? Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange[200]!,
                          Colors.red[400]!,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1.5,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                : const Center(),
          ),
        ),
      );

  TextField buildTextField(
          IconData icon, String hintText, bool isPassword, bool isEmail) =>
      TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Constant.iconColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Constant.textColor1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Constant.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Constant.textColor1),
        ),
      );
}
