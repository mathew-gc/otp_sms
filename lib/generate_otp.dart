import 'dart:math';

String generateOTP() {
  var random = Random();
  String otp = '';
  for (var i = 0; i < 6; i++) {
    otp += random.nextInt(9).toString();
  }
  return otp;
}