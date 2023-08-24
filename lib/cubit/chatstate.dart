import 'package:scholar_chat/models/message.dart';

abstract class chatstate {}

class chatintial extends chatstate {}

class chatsuccsse extends chatstate {
  List<Message>messages=[];
  chatsuccsse({required this.messages});
}
