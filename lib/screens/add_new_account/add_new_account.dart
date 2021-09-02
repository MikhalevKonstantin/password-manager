import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class AddNewAccount extends StatefulWidget {
  const AddNewAccount({Key? key}) : super(key: key);

  @override
  State<AddNewAccount> createState() => _AddNewAccountState();
}

class _AddNewAccountState extends State<AddNewAccount> {
  bool _hidePass = true;

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///TODO A2 (change top panel)
      backgroundColor: ColorPalette.white,
     body: SafeArea(
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Stack(
               children: [
                 Container(
                   width: MediaQuery.of(context).size.width,
                   height: 194,
                   child: Image.asset('assets/images/Backgroundtop.png', fit: BoxFit.cover),
                 ),
                 Positioned(
                   top: 160,
                   child: Container(
                     //padding: EdgeInsets.symmetric(horizontal: 20.0),
                     decoration: BoxDecoration(
                       color: ColorPalette.white,
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(26.0),
                         topRight: Radius.circular(26.0),
                       ),
                     ),
                     width: MediaQuery.of(context).size.width,
                     height: 34,
                   ),
                 ),
                 Positioned(
                   //top: 56,
                   //left: 46,
                   child: Container(
                     width:  MediaQuery.of(context).size.width,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 46, right: 46),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         //crossAxisAlignment: Cross,
                         children: [
                           Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               color: ColorPalette.c53c1fc,
                             ),
                             width: 45,
                             height: 45,
                             child: IconButton(
                               icon: SvgPicture.asset('assets/svg_icons/Left Icon.svg'),
                               onPressed: () {
                               },
                             ),
                           ),
                           Text('Facebook',style: TextThemes.hedline_11,),
                           Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               color: ColorPalette.c53c1fc,
                             ),
                             width: 45,
                             height: 45,
                             child: IconButton(
                               icon: SvgPicture.asset('assets/svg_icons/pen24.svg'),
                               onPressed: () {
                               },
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               ],
             ),

             ListTile(
               title: Text('Name', style: TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),),
               subtitle: Text('Facebook', style: TextThemes.hedline_2.copyWith(color: ColorPalette.c3A3943),),
             ),
             ListTile(
               title: Text('URL', style: TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),),
               subtitle: Text('https://www.facebook.com/', style: TextThemes.hedline_5.copyWith(color: ColorPalette.c3A3943),),
             ),
             ListTile(
               title: Text('Username', style: TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),),
               subtitle: Text('nik_87@tut.by', style: TextThemes.hedline_5.copyWith(color: ColorPalette.c3A3943),),
             ),
             Padding(
               padding: EdgeInsets.only(right: 20, left: 20),
               child: TextField(
                 style: TextStyle(color: ColorPalette.c3A3943),
                 cursorColor: ColorPalette.c53c1fc,
                 //controller: _passwordController,
                 obscureText: _hidePass,
                 decoration: InputDecoration(
                   enabledBorder: UnderlineInputBorder(
                     borderSide:
                     BorderSide(color: ColorPalette.white),
                   ),
                   focusedBorder: UnderlineInputBorder(
                     borderSide:
                     BorderSide(color: ColorPalette.white),
                   ),

                   // labelStyle: TextThemes.hedline_2,
                   labelText: 'Password',
                   labelStyle: TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
                   //hintText: 'Password',
                   hintStyle: TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
                   suffixIcon: IconButton(
                     icon: _hidePass
                         ? SvgPicture.asset(
                       'assets/svg_icons/eyecl.svg',
                       color: ColorPalette.c3A3943,
                     )
                         : SvgPicture.asset(
                       'assets/svg_icons/eye.svg',
                       color: ColorPalette.c3A3943,
                     ),
                     onPressed: () {
                       setState(() {
                         _hidePass = !_hidePass;
                       });
                     },
                   ),
                 ),
               ),
             ),
             ListTile(
               title: Text('Notes', style: TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),),
               subtitle: Text('Some notes', style: TextThemes.hedline_5.copyWith(color: ColorPalette.c3A3943),),
             ),
             Text(''),
             Text(''),
           ],
         ),
       ),
      ),
        //AppBar(
      //   //title: Image.asset('assets/images/Backgroundtop.png', fit: BoxFit.fill,),
      //   // titleSpacing: MediaQuery.of(context).size.width,
      //   flexibleSpace: Image.asset('assets/images/Backgroundtop.png'),
      // ),
    );
  }
}
