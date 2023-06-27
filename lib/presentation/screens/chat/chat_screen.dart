import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_five_app/domain/entities/message.dart';
import 'package:sec_five_app/presentation/providers/chat_provider.dart';
import 'package:sec_five_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:sec_five_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:sec_five_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://content.solsea.io/files/thumbnail/1675435308306-74226444.png'
            ),
          ),
        ),
        title: const Text('Darth Vader 🖕🏻'),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollCtrl,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final msg = chatProvider.messageList[index];

                  return (msg.fromWho == FromWho.your) ? YourMessageBubble(message: msg,) :  MyMessageBubble(message: msg,);
                },
              )
            ),
            // MessageFieldBox( onValue: (txt) async =>  await chatProvider.sendMessage(txt) ),
            // * EQUIVALENTE: CUANDO EN NO DE ARGUMENTOS SON LOS MISMO (VALOR RECIBIDO VS PARAMS FUNCION CALLBACK)
            MessageFieldBox( onValue: chatProvider.sendMessage ),
          ],
        ),
      ),
    );
  }
}