import 'package:flutter/material.dart';
import 'package:sec_five_app/config/helpers/get_yes_no_answer.dart';
import 'package:sec_five_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollCtrl = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hello!', fromWho: FromWho.me),
    Message(text: '...?', fromWho: FromWho.your)
  ];

  Future<void> sendMessage(String msg) async{
    if( msg.isEmpty ) return;

    final newMessage = Message(text: msg, fromWho: FromWho.me);
    messageList.add(newMessage);

    if( msg.endsWith('?') ) {
      await yourReplay();
    }
    
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> yourReplay() async {
    final yourMessage = await getYesNoAnswer.getAnswer();
    messageList.add(yourMessage);
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollCtrl.animateTo(
      chatScrollCtrl.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }

}