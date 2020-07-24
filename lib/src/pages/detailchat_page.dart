import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/models/userResponder_model.dart';
import 'package:whatsappclone/src/styles/styles.dart';

class DetailChat extends StatelessWidget {
  final UserResponse user;
  final stylesApp = StylesApp();

  DetailChat({@required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Hero(
              tag: user.id,
              child: CircleAvatar(
                radius: 20,
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: 50,
                    height: 80,
                    imageUrl: user.url,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(user.name, style: stylesApp.nameChatDetail)
          ],
        ),
        actions: <Widget>[
          SizedBox(width: 10),
          Icon(Icons.videocam),
          SizedBox(width: 10),
          Icon(Icons.call),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MessageFriend(
              user: user,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomTolBarChat(),
          )
        ],
      ),
    );
  }
}

class MessageFriend extends StatelessWidget {
  final UserResponse user;
  final stylesApp = StylesApp();
  MessageFriend({this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 380,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xff2C373D)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                user.title,
                style: stylesApp.messageChatDetail,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 10),
            Text(user.hora, style: stylesApp.hourChat),
          ],
        ),
      ),
    );
  }
}

class BottomTolBarChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Expanded(child: MessageBoxBottom()),
          SizedBox(width: 5.0),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.mic),
          )
        ],
      ),
    );
  }
}

class MessageBoxBottom extends StatelessWidget {
  final stylesApp = StylesApp();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xff2C373D)),
      child: Row(
        children: <Widget>[
          SizedBox(width: 5.0),
          Icon(Icons.face, color: stylesApp.iconsTools),
          SizedBox(width: 5.0),
          Expanded(
              child:
                  Text("Escribe un mensaje", style: stylesApp.messageChatBox)),
          Icon(Icons.attach_file, color: stylesApp.iconsTools),
          SizedBox(width: 5.0),
          Icon(Icons.camera_alt, color: stylesApp.iconsTools),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
