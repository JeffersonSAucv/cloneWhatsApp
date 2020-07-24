import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StylesApp {
  final titulo = TextStyle(color: Colors.white);
  final body = TextStyle(color: Colors.white, fontSize: 24);

  final nameChat = TextStyle(color: Colors.white, fontSize: 16);
  final nameChatDetail =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
  final messageChat =
      TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13);
  final messageChatDetail =
      TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16);
  final messageChatBox =
      TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16);
  final messageStatus =
      TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14);
  final hourChat =
      TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12);
  final iconsTools = Colors.white.withOpacity(0.6);
  final iconsToolsGreen = Color(0xff00BFA5);
}
