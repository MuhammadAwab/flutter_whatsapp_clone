import 'Chat.dart';
import 'ChatBuddy.dart';

class DummyData{
  final int conversationLength = 12;
  final List<String> messages = <String>['what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello'];
  final List<String> messagesTimeStamp = <String>['what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello','what are you doing','hi','hello'];
  final List<String> images = <String>['susan','mark','jack','micheal','katherine','susan','mark','jack','micheal','katherine'];
  final List<String> names = <String>['Susan','Mark','Jack','Micheal','Katherine','Laura','Jimmy','John','Bob','Alice'];
  final List<String> lastMessage = <String>['hello','i dont know yet','lets see','see you later','still there??','lol..that was so cool','i need this urgent','absolutely no idea','i will ask him','you must be kidding'];
  final List<String> lastTime = <String>['1:30 pm','Yesterday','12/18/20','12/17/2020','12/17/2020','11/23/2020','11/17/2020','11/10/2020','10/25/2020','10/21/2020'];


  List<Chat> dummyChat(){
    List<Chat> listChat = new List<Chat>();

    Chat chat = new Chat('hi','1:30 pm');
    Chat chat1 = new Chat('hello','1:31 pm');
    Chat chat2 = new Chat('what are you doing?','1:32 pm');

    listChat.add(chat);
    listChat.add(chat1);
    listChat.add(chat2);

    return listChat;
  }

  List<ChatBuddy> dummyChatBuddies(){
    List<ChatBuddy> listOfBuddies = new List<ChatBuddy>();

    ChatBuddy buddy = new ChatBuddy('Susan','susan','hello','1:30 pm');
    ChatBuddy buddy1 = new ChatBuddy('Mark','mark','i dont know yet','Yesterday');
    ChatBuddy buddy2 = new ChatBuddy('Jack','jack','lets see','12/18/20');
    ChatBuddy buddy3 = new ChatBuddy('Micheal','micheal','see you later','12/17/2020');
    ChatBuddy buddy4 = new ChatBuddy('Katherine','katherine','still there??','12/17/2020');

    listOfBuddies.add(buddy);
    listOfBuddies.add(buddy1);
    listOfBuddies.add(buddy2);
    listOfBuddies.add(buddy3);

    return listOfBuddies;
  }
  
}