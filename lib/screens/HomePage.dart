import 'dart:core';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ChatScreen.dart';

class HomePage extends StatefulWidget {
  final CameraDescription camera;
  const HomePage({
    Key key,
    @required this.camera,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CameraController controller;
  final List<String> images = <String>['susan','mark','jack','micheal','katherine','susan','mark','jack','micheal','katherine'];
  final List<String> names = <String>['Susan','Mark','Jack','Micheal','Katherine','Laura','Jimmy','John','Bob','Alice'];
  final List<String> lastMessage = <String>['hello','i dont know yet','lets see','see you later','still there??','lol..that was so cool','i need this urgent','absolutely no idea','i will ask him','you must be kidding'];
  final List<String> lastTime = <String>['1:30 pm','Yesterday','12/18/20','12/17/2020','12/17/2020','11/23/2020','11/17/2020','11/10/2020','10/25/2020','10/21/2020'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
                appBar: _appBar(context),
                body: _tabsView(context,names,images,lastMessage,controller,lastTime),
    ));
  }


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

Widget _appBar(BuildContext context){
  return AppBar(
    title: Text('HelloChat',style: TextStyle(color: Colors.white70),),
    bottom: _tabLayout(context),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () {
          // do something
        },
      ),
      IconButton(
        icon: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onPressed: () {
          // do something
        },
      )
    ],
  );
}

Widget _tabsView(BuildContext context,List<String> names,List<String> images,List<String> lastMessage,CameraController controller,List<String> lastTime){
  return TabBarView(
      children: <Widget>[
        _camView(context,controller),
        _chatView(context,names,images,lastMessage,lastTime),
        _statusView(context),
        _callsView(context),
      ]
  );
}

Widget _camView(BuildContext context,CameraController controller){
  return AspectRatio(
      aspectRatio: 3/2,
      child: CameraPreview(controller));
}
Widget _chatView(BuildContext context,List<String> names,List<String> images,List<String> lastMessage,List<String> lastTime){
  return Container(
    color: Colors.black12,
    child: ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage('assets/images/'+images[index]+'.jpg'),radius:25,),
          title: Text(names[index]),
          subtitle: Text(lastMessage[index]),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(lastTime[index],style: TextStyle(fontSize: 10),),
              SizedBox(height: 5,)
            ],
          ),
          onTap:(){ Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen(name: names[index],image: images[index])),
          );}
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.black38,),
    )
  );
}
Widget _statusView(BuildContext context){
  return Container(color: Colors.red,);
}
Widget _callsView(BuildContext context){
  return Container(color: Colors.purple,);
}

Widget _tabLayout(BuildContext context){
  return TabBar(
      tabs: <Widget>[
          Tab(icon: Icon(Icons.camera_alt),),
          Tab(text: 'CHATS',),
          Tab(text: 'STATUS',),
          Tab(text: 'CALLS',)
      ]
  );
}
