import 'package:flutter/material.dart';
import 'package:whatsappclone/src/models/userResponder_model.dart';

import 'package:whatsappclone/src/pages/detailchat_page.dart';
import 'package:whatsappclone/src/services/apiCall.dart';
import 'package:whatsappclone/src/styles/styles.dart';
import 'package:whatsappclone/src/widget/chatWidget.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  StylesApp stylesApp = StylesApp();

  @override
  void initState() {
    super.initState();
    ApiCall().apiCall();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color(0xff101D25),
      body: FutureBuilder(
        future: ApiCall().apiCall(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("error", style: stylesApp.body);

            case ConnectionState.active:
              return Text("active", style: stylesApp.body);

            case ConnectionState.done:
              return Center(
                child: Container(
                  child: ListView.separated(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      UserResponse userResponse = snapshot.data[index];
                      return ChatWidget(
                        user: userResponse,
                        onTap: () {
                          print(userResponse.id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailChat(
                                        user: userResponse,
                                      )));
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 90, right: 20),
                        child: Divider(color: Colors.white.withOpacity(0.35)),
                      );
                    },
                  ),
                ),
              );

            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              return Text("done", style: stylesApp.body);
          }
        },
      ),
      /* floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff00BFA5),
        onPressed: () {},
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ), */
    );
  }

  @override
  bool get wantKeepAlive => true;
}
