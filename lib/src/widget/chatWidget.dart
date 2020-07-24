import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/models/userResponder_model.dart';
import 'package:whatsappclone/src/styles/styles.dart';

class ChatWidget extends StatelessWidget {
  final UserResponse user;
  final Function onTap;
  final stylesApp = StylesApp();

  ChatWidget({Key key, this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 30,
          child: ClipOval(
            child: CachedNetworkImage(
              width: 60,
              height: 120,
              imageUrl: user.url,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        title: Text(
          user.name,
          maxLines: 1,
          style: stylesApp.nameChat,
        ),
        subtitle: Text(user.title, style: stylesApp.messageChat),
        trailing: Text(user.hora, style: stylesApp.hourChat),
      ),
    );
  }
}
