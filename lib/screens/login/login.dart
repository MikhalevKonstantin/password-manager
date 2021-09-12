import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:password_manager/components/decoration_box.dart';
import 'package:password_manager/screens/passwords/passwords.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: decorationBox(),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/BG pattern.png',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(flex: 1, child: Container()),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Welcome back', style: TextThemes.hedline_0),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Image.asset('assets/images/fase80.png'),
                        SizedBox(height: 90),
                        Text(
                          'or',
                          style: TextThemes.hedline_2,
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFormField(
                                  style: TextStyle(color: ColorPalette.white),
                                  cursorColor: Colors.white,
                                  controller: _passwordController,
                                  obscureText: _hidePass,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),

                                    // labelStyle: TextThemes.hedline_2,
                                    // labelText: 'Enter Your Password1',
                                    hintText: 'Enter Your Password',
                                    hintStyle: TextThemes.hedline_3,
                                    suffixIcon: IconButton(
                                      icon: _hidePass
                                          ? SvgPicture.asset(
                                              'assets/svg_icons/eyecl.svg',
                                              color: ColorPalette.white,
                                            )
                                          : SvgPicture.asset(
                                              'assets/svg_icons/eye.svg',
                                              color: ColorPalette.white,
                                            ),
                                      onPressed: () {
                                        setState(() {
                                          _hidePass = !_hidePass;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    return _validatePassword(value);
                                  },
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                            SizedBox(height: 15),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 66,
                                child: CupertinoButton(
                                  borderRadius: BorderRadius.circular(20),
                                  onPressed: _submitForm,
                                  color: Colors.white,
                                  child: Text(
                                    'Login',
                                    style: TextThemes.hedline_4
                                        .copyWith(color: ColorPalette.c53c1fc),
                                  ),
                                ),
                              ),
                            ),
                            //SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => Passwords()),
      );
    } else {
      _showMessage(message: 'form is not valid! Please review and correct');
    }
  }

  _validatePassword(value) {
    if (_passwordController.text.length < 1) {
      return '0 character required for password';
    } else {
      return null;
    }
  }

  void _showMessage({required String message}) {
    _scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
