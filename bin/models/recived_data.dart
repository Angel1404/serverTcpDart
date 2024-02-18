class RecivedDataIpAndPort {
  final String ip;
  final String port;
  final bool connect;
  final double? weitgh;
  final double? height;

  RecivedDataIpAndPort({
    required this.ip,
    required this.port,
    required this.connect,
    this.weitgh,
    this.height,
  });

  factory RecivedDataIpAndPort.fromJson(Map<String, dynamic> map) {
    return RecivedDataIpAndPort(
      ip: map["ip"],
      port: map["port"],
      weitgh: map["weitgh"],
      height: map["height"],
      connect: map["connect"],
    );
  }
}
