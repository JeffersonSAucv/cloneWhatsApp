import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/models/userResponder_model.dart';

class DetailStatusPage extends StatelessWidget {
  final UserResponse user;

  DetailStatusPage({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CachedNetworkImage(
        width: 52,
        height: 52,
        imageUrl: user.thumbnailUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
