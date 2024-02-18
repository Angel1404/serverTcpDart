import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import '../models/recived_data.dart';
import '../models/response_socket.dart';
import '../services/calculate_imc.dart';

void main() {
  // Crea un StreamTransformer para decodificar los datos.
  final transformer = StreamTransformer<Uint8List, dynamic>.fromHandlers(
    handleData: (Uint8List data, EventSink<dynamic> sink) {
      var str = utf8.decoder.convert(data);
      sink.add(str);
    },
  );
  final ip = "192.168.1.144";
  final port = "39802";
  ServerSocket.bind("192.168.1.144", 39802).then((ServerSocket server) {
    print("IP A LA QUE APUNTA : ${InternetAddress.loopbackIPv4}");
    server.listen((Socket client) {
      client.transform(transformer).listen((data) {
        final dataIpAndPort = RecivedDataIpAndPort.fromJson((json.decode(data) as Map<String, dynamic>));
        print(data);
        if (dataIpAndPort.connect) {
          if (dataIpAndPort.ip == ip && dataIpAndPort.port == port) {
            client.write(ResponseSocket(message: "connec", success: true).toJson());
          } else {
            client.write(ResponseSocket(message: "Ip y port incorrectos", success: false).toJson());
          }
        } else {
          final responseImc = CalculateImc.calculate(dataIpAndPort);
          client.write(responseImc);
        }
      });

      client.done.then((_) {
        client.destroy();
      });
    });
  });
}
