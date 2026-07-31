import 'dart:io';
import 'package:osc/osc.dart';

class OscService {
  String ipAddress;
  int port;
  RawDatagramSocket? _socket;

  OscService({required this.ipAddress, this.port = 7000});

  Future<void> connect() async {
    try {
      _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      print('OSC Service ready to send to $ipAddress:$port');
    } catch (e) {
      print('Error binding socket: $e');
    }
  }

  void sendDimmerValue(int dmxAddress, int value) {
    if (_socket == null) return;
    
    // Construct an OSC Message. Sunlite's OSC structure may vary,
    // but sending raw DMX or specific page commands is typical.
    // Assuming Sunlite is configured to listen to /dmx/address
    // For generic Sunlite OSC, often the path is related to a mapped button.
    // Here we use a generic path that can be mapped in Sunlite Console.
    final message = OSCMessage(
      '/dmx/$dmxAddress',
      arguments: [value],
    );

    final bytes = message.toBytes();
    _socket?.send(bytes, InternetAddress(ipAddress), port);
  }

  void dispose() {
    _socket?.close();
  }
}
