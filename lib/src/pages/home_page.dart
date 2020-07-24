import 'package:flutter/material.dart';
import 'package:whatsappclone/src/pages/call_page.dart';
import 'package:whatsappclone/src/pages/chat_page.dart';
import 'package:whatsappclone/src/pages/story_page.dart';
import 'package:whatsappclone/src/styles/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final stylesApp = StylesApp();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp",
          style: stylesApp.body,
        ),
        bottom: TabBar(
          indicatorColor: Color(0xff00BFA5),
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "ESTADOS"),
            Tab(text: "LLAMADAS"),
          ],
        ),
        actions: <Widget>[
          SizedBox(
            width: 10,
          ),
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Icon(Icons.camera),
          ChatPage(),
          StatusPage(),
          CallPage(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
