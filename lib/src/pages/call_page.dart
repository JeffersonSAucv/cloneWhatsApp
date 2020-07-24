import 'package:flutter/material.dart';
import 'package:whatsappclone/src/models/userResponder_model.dart';
import 'package:whatsappclone/src/services/apiCall.dart';
import 'package:whatsappclone/src/styles/styles.dart';
import 'package:whatsappclone/src/widget/call_widget.dart';

import 'package:whatsappclone/src/widget/customFloatingActionButtom.dart';

class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage>
    with AutomaticKeepAliveClientMixin {
  final stylesApp = StylesApp();
  @override
  void initState() {
    super.initState();
    ApiCall().apiCall();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(
        future: ApiCall().apiCall(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("error", style: stylesApp.body);

            case ConnectionState.active:
              return Text("active", style: stylesApp.body);

            case ConnectionState.done:
              return ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  UserResponse userResponse = snapshot.data[index];
                  return CallWidget(
                    user: userResponse,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 90, right: 20),
                    child: Divider(color: Colors.white.withOpacity(0.35)),
                  );
                },
              );

            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              return Text("done", style: stylesApp.body);
          }
        },
      ),
      floatingActionButton: CustomFloatingActionsButtons(
        icon1: Icons.video_call,
        icon2: Icons.call,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
