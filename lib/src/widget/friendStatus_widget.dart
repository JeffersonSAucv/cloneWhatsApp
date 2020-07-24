import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/models/userResponder_model.dart';
import 'package:whatsappclone/src/styles/styles.dart';

class FriendsStoryWidget extends StatelessWidget {
  final UserResponse user;
  final Function onTap;
  final stylesApp = StylesApp();

  FriendsStoryWidget({this.user, this.onTap});

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
            imageUrl: user.thumbnailUrl,
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
      subtitle: Text(
        user.hora,
        style: stylesApp.messageChat,
      ),
    );
  }
}
