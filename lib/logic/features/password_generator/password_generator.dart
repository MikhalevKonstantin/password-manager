import 'dart:math';

String generatePassword({
  bool lowerCase = true,
  bool upperCase = true,
  bool isNumber = true,
  bool isSpecial = true,
  int length = 20,
}) {

  final letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
  final letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final number = '0123456789';
  final special = '@#%^*>\$@?/[]=+';

  String chars = "";
  if (lowerCase) chars += '$letterLowerCase';
  if(upperCase)chars += '$letterUpperCase';
  if (isNumber) chars += '$number';
  if (isSpecial) chars += '$special';


  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars [indexRandom];
  }).join('');
}