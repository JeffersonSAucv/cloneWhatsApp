import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/styles/styles.dart';

class StoryWidget extends StatelessWidget {
  final String photo;
  final stylesApp = StylesApp();
  StoryWidget({Key key, this.photo}) : super(key: key);
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
            imageUrl: photo,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
      title: Text(
        "Mi estado",
        style: stylesApp.titulo,
      ),
      subtitle: Text(
        "Justo Ahora",
        style: stylesApp.messageChat,
      ),
      trailing: Icon(
        Icons.more_horiz,
        color: stylesApp.iconsTools,
      ),
    );
  }
}
