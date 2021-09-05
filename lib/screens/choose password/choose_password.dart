import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/components/decoration_box.dart';
import 'package:password_manager/screens/face_id/face_id.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoosePassword extends StatefulWidget {
  @override
  State<ChoosePassword> createState() => _ChoosePasswordState();
}

class _ChoosePasswordState extends State<ChoosePassword> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();

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
                      children: [
                        Text('Welcome', style: TextThemes.hedline_0),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Choose a master password',
                            style: TextThemes.hedline_21),
                        SizedBox(height: 20),
                        Text(
                          'To unlock the app, you will need to create'
                          ' \na master password. Please note that for '
                          '\nsecurity reasons it cannot be recovered.',
                          style: TextThemes.hedline_2,
                        ),
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
                                TextFormField(
                                  cursorColor: ColorPalette.white,
                                  style: TextStyle(color: ColorPalette.white),
                                  controller: _confirmController,
                                  obscureText: _hidePass,
                                  decoration: InputDecoration(
                                    //fillColor: ColorPalette.white,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelStyle: TextThemes.hedline_2,
                                    //labelText: 'Confirm  Password *',
                                    hintText: 'Confirm the password',
                                    hintStyle: TextThemes.hedline_3,
                                    suffixIcon: IconButton(
                                      color: ColorPalette.white,
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
                                        setState(
                                          () {
                                            _hidePass = !_hidePass;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    return _validatePassword(value);
                                  },
                                ),
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
                                    'Continue',
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
        CupertinoPageRoute(builder: (context) => FaceID()),
      );
    } else {
      _showMessage(message: 'form is not valid! Please review and correct');
    }
  }

  _validatePassword(value) {
    if (_passwordController.text.length < 1) {
      return '0 character required for password';
    } else if (_confirmController.text != _passwordController.text) {
      return 'Password does not match';
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

//   void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             'Registration successful',
//             style: TextStyle(
//               color: Colors.green,
//             ),
//           ),
//           content: Text(
//             'hi',
//             style: TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 18.0,
//             ),
//           ),
//           actions: [
//             FlatButton(
//               onPressed: () {
//                 //Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => FaceID(),
//                   ),
//                 );
//               },
//               child: Text(
//                 'Verified',
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
}
