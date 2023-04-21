
import 'package:telephony/telephony.dart';

Future<void> sendSMS(String message, String recipient) async {

  // Envía el mensaje de texto 
  Telephony telephony = Telephony.instance;
  try {
    await telephony.sendSms(to: recipient, message: message);
  } catch (e) {
    throw Exception('Error al enviar SMS: ${e.toString()}');
  }
} 

//Nota, solo funciona en android.