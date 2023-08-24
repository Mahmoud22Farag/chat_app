import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/cubit/chatstate.dart';
import 'package:scholar_chat/models/message.dart';

import '../constants.dart';

class chatcubit extends Cubit<chatstate> {
  chatcubit() : super(chatintial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  void sendmessage({required String message, required String email}) {
    messages.add(
      {kMessage: message, kCreatedAt: DateTime.now(), 'id': email},
    );
  }

  void getmessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messageList=[];
      for(var doc in event.docs){
        messageList.add(Message.fromJson(doc));
      }
      emit(chatsuccsse(messages: messageList));
    });
  }
}
