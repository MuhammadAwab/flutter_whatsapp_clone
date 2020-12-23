import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class ChatScreen extends StatefulWidget {
  String name;
  String image;
  ChatScreen({Key key,@required this.name,this.image}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin{
  final int conversationLength = 12;
  final List<String> messages = <String>['what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello'];
  final List<String> messagesTimeStamp = <String>['what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(widget.name,widget.image),
      body: conversationBody(context),
      //bottomNavigationBar: bottomChatBar(context),
      //floatingActionButton: FAB(),

    );
  }

  Widget chatAppBar(String name,String image){
    return AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){Navigator.pop(context);},),
      title: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/'+image+'.jpg'),radius: 20,),
          SizedBox(width: 10,),
          Text(name)
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.video_call,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),
        IconButton(
          icon: Icon(
            Icons.phone,
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

  Widget conversationBody(BuildContext context){
    return Column(
      children: [
        Expanded(child: ListView.builder(
          reverse: true,
          itemCount: conversationLength,
          itemBuilder: (BuildContext context, int index) {
            return (index%2==0)?ChatBubble(
              clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Colors.red,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
                child: Text(
                  messages[index],
                  style: TextStyle(color: Colors.white),
            ),
          ),
          ):
            ChatBubble(
                clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                backGroundColor: Color(0xffE7E7ED),
                margin: EdgeInsets.only(top: 20),
              child: Container(
                constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  messages[index],
                  style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
      ),),
        bottomChatBar(context)
      ]);
  }

  Widget bottomChatBar(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 0, 20),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.redAccent,
            ),
            child: Row(
              children: [
                IconButton(icon:Icon(Icons.insert_emoticon,color: Colors.white,),onPressed: null,),
                SizedBox(width: MediaQuery.of(context).size.width/2.75,
                  child: TextField(cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(hintText: 'Type Message Here',hintStyle: TextStyle(color: Colors.white),focusColor: Colors.white,border: InputBorder.none),),),
                IconButton(icon:Icon(Icons.attach_file,color: Colors.white),onPressed: null,),
                IconButton(icon:Icon(Icons.camera_alt,color: Colors.white),onPressed: null,),

              ],
            ),),
           SizedBox(width: 5,),
           Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)),color: Colors.black45),child: IconButton(icon: Icon(Icons.mic,color: Colors.white), onPressed: null),)
        ],
      ),
    );
  }

  
  Widget FAB(){
    return FloatingActionButton.extended(onPressed: null, label: null);
  }
}
