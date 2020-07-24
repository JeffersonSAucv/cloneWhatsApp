import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/models/userResponder_model.dart';
import 'package:whatsappclone/src/styles/styles.dart';

class CallWidget extends StatelessWidget {
  final UserResponse user;
  final stylesApp = StylesApp();

  CallWidget({this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xff00BFA5),
        radius: 40,
        child: ClipOval(
          child: CachedNetworkImage(
            width: 52,
            height: 52,
            imageUrl: user.url,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
      title: Text(
        user.name,
        style: stylesApp.titulo,
      ),
      subtitle: Row(
        children: <Widget>[
          user.incomingCall == true
              ? Icon(Icons.call_made,
                  color: stylesApp.iconsToolsGreen, size: 18)
              : Icon(Icons.call_received,
                  color: stylesApp.iconsToolsGreen, size: 18),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              user.hora,
              style: stylesApp.messageChat,
            ),
          )
        ],
      ),
      trailing: Icon(
        Icons.call,
        size: 25,
        color: stylesApp.iconsToolsGreen,
      ),
    );
  }
}
