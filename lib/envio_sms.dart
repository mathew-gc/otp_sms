
import 'package:direct_sms/direct_sms.dart';

Future<void> sendSMS(String message, String recipient) async {

  // Envía el mensaje de texto 
  try {
    await DirectSms().sendSms(phone: recipient, message: message);
  } catch (e) {
    throw Exception('Error al enviar SMS: ${e.toString()}');
  }
} 

//Nota, solo funciona en android.