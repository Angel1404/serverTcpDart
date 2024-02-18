import 'dart:math';

import '../models/recived_data.dart';

class CalculateImc {
  static String calculate(RecivedDataIpAndPort dataIpAndPort) {
    final imc = dataIpAndPort.weitgh! / pow(dataIpAndPort.height!, 2);
    String messageImc = "";
    if (imc < 18.5) {
      messageImc = "Bajo peso";
    }
    if (imc > 18.5 && imc < 24.9) {
      messageImc = "Peso normal";
    }
    if (imc > 25 && imc < 29.9) {
      messageImc = "Sobre peso";
    }
    if (imc > 30 && imc < 34.9) {
      messageImc = "Obecidad grado I";
    }
    if (imc > 35 && imc < 39.9) {
      messageImc = "Obecidad grado II";
    }
    if (imc > 40) {
      messageImc = "Obecidad grado III";
    }
    return "$messageImc - IMC: $imc";
  }
}
